<?php
namespace App\Controller;
use App\Controller\AppController;
use Cake\Mailer\Email;
use Cake\Event\Event;
use App\Controller\Files;
/**
 * Comprovantes Controller
 *
 * @property \App\Model\Table\ComprovantesTable $Comprovantes
 */
class ComprovantesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function initialize(){
        parent::initialize();        
        // Load Files model
        $this->loadModel('Files');
        
       
    }


    public function index()
    {
        $this->paginate = [
            'contain' => ['Users', 'Files']
        ];
        $comprovantes = $this->paginate($this->Comprovantes);

        $this->set(compact('comprovantes'));
        $this->set('_serialize', ['comprovantes']);
    }

    /**
     * View method
     *
     * @param string|null $id Comprovante id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $comprovante = $this->Comprovantes->get($id, [
            'contain' => ['Users', 'Files']
        ]);

        $this->set('comprovante', $comprovante);
        $this->set('_serialize', ['comprovante']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|null Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
       
        $comprovante = $this->Comprovantes->newEntity();
        $comprovante = $this->Comprovantes->patchEntity($comprovante, $this->request->getData());
        if ($this->request->is('post')) {

            if(!empty($this->request->data['arquivo']['name'])){
                $fileName = $this->request->data['arquivo']['name'];
                $uploadPath = 'uploads/files/';
                $file = $this->Files->uploadAndSaveFile($this->request->data['arquivo']['tmp_name'],$uploadPath,$fileName);
                $comprovante->recibo_id = $file->id;
                
            }else{
                $this->Flash->error(__('nao escolheu arquivo.'));
            }


         
            if ($this->Comprovantes->save($comprovante)) {
                $this->Flash->success(__('The comprovante has been saved.'));

        $email = new Email('default');
        $email->from(['alexandrehenriquenascimento123@gmail.com' => 'WEB 2'])
        ->to('tesevd@gmail.com')
        ->subject('About')
        ->attachments([ WWW_ROOT.$file->path.$file->name])
        ->send();
        

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The comprovante could not be saved. Please, try again.'));
        }
        $users = $this->Comprovantes->Users->find('list', ['limit' => 200]);
        $files = $this->Comprovantes->Files->find('list', ['limit' => 200]);
        $this->set(compact('comprovante', 'users', 'files'));
        $this->set('_serialize', ['comprovante']);
    }   

    /**
     * Edit method
     *
     * @param string|null $id Comprovante id.
     * @return \Cake\Network\Response|null Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $comprovante = $this->Comprovantes->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $comprovante = $this->Comprovantes->patchEntity($comprovante, $this->request->getData());
            if ($this->Comprovantes->save($comprovante)) {
                $this->Flash->success(__('The comprovante has been saved.'));


    

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The comprovante could not be saved. Please, try again.'));
        }
        $users = $this->Comprovantes->Users->find('list', ['limit' => 200]);
        $files = $this->Comprovantes->Files->find('list', ['limit' => 200]);
        $this->set(compact('comprovante', 'users', 'files'));
        $this->set('_serialize', ['comprovante']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Comprovante id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $comprovante = $this->Comprovantes->get($id);
        if ($this->Comprovantes->delete($comprovante)) {
            $this->Flash->success(__('The comprovante has been deleted.'));
        } else {
            $this->Flash->error(__('The comprovante could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

    public function aprovar($id = null)
    {
        $comprovante = $this->Comprovantes->get($id);
        $comprovante->aproved = !$comprovante->aproved;
        $this->Comprovantes->save($comprovante);
        return $this->redirect(['action' => 'index']);
    }


     public function download()
  {
    $name = $this->response->data['arquivo']['name'];
    $this->response->download($name);
    $this->render(false);
  }
    
}
