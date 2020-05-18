<?php namespace Application\AdminCodex\Form;

use Andesite\Codex\Form\Dictionary\Dictionary;
use Andesite\Codex\Form\Field;
use Andesite\Codex\Form\FormDecorator;
use Andesite\Codex\Form\FormHandler\FormHandler;
use Andesite\Codex\Form\ListHandler\ListHandler;
use Andesite\Codex\Interfaces\DataProviderInterface;
use Andesite\DBAccess\Connection\Filter\Filter;
use Application\AdminCodex\GhostHelper\UserGhostCodexHelper;
use Application\Component\Constant\Permission\Role;
use Application\Ghost\App;
use Application\Ghost\AppPermission;
use Application\Ghost\Permission;
use Application\Ghost\User;

class UserCodex extends UserGhostCodexHelper{

	protected function decorator(FormDecorator $decorator){
		$decorator->setIcons('fal fa-user');
		$decorator->setTitle('Felhasználók');
		$decorator->setRole(Role::Admin);
	}

	protected function createDataProvider(): DataProviderInterface{

		$dataProvider = parent::createDataProvider();
		$dataProvider->addFieldConverter('permissions', function (User $item){ return Permission::getPermissionIds($item->id); });

		return $dataProvider;
	}

	protected function listHandler(ListHandler $list){
		$list->addJSPlugin('ListButtonAddNew');
		$list->add($this->id)->visible(false);
		$list->add($this->name);
		$list->add($this->groups)->dictionary(new Dictionary($this->groups->options));
	}

	protected function formHandler(FormHandler $form){

		$form->setLabelField($this->name);
		$form->addJSPlugin('FormButtonSave', 'FormButtonDelete', 'FormButtonReload');
		$form->addJSPlugin('FormButtonFiles');

		$form->setOnSave(function ($id, $data){
			Permission::set($id, $data['permissions']);
			if ($data['newpassword']){
				$user = User::pick($id);
				$user->password = $data['newpassword'];
				$user->save();
			}
		});

		$permissions = [];
		foreach (App::search()->asc('name')->collect() as $app){
			foreach (AppPermission::search(Filter::where('appId=$1', $app->id))->asc('permission')->collect() as $permission){
				$permissions[$permission->id] = $app->name . ':' . $permission->permission;
			}
		}

		$form->addAttachmentCategory($this->avatar);

		$main = $form->section('');
		$main->input('string', $this->name);
		$main->input('string', $this->email);
		$main->input('string', $this->displayNameHu);
		$main->input('string', $this->displayNameEn);
		$main->input('string', $this->login);
		$main->input('string', $this->neptun);
		$main->input('checkboxes', $this->groups)
		('options', $this->groups->options);
		$main->input('checkboxes', new Field('permissions'), 'jogosultságok')
		('options', $permissions);
		$main->input('string', new Field('newpassword'), 'új jelszó');
	}

}
