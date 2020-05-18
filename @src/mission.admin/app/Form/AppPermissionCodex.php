<?php namespace Application\AdminCodex\Form;

use Andesite\Codex\Form\Field;
use Andesite\Codex\Form\FormDecorator;
use Andesite\Codex\Form\FormHandler\FormHandler;
use Andesite\Codex\Form\ListHandler\ListHandler;
use Andesite\Codex\Interfaces\DataProviderInterface;
use Application\AdminCodex\GhostHelper\AppPermissionGhostCodexHelper;
use Application\Component\Constant\Permission\Role;
use Application\Ghost\App;
use Application\Ghost\ApplicationCategory;

class AppPermissionCodex extends AppPermissionGhostCodexHelper{

	protected function decorator(FormDecorator $decorator){
		$decorator->setIcons('fal fa-user-lock');
		$decorator->setTitle('Jogosultságok');
		$decorator->setRole(Role::Admin);
	}

	protected function createDataProvider(): DataProviderInterface{
		$dataProvider = parent::createDataProvider();
		$dataProvider->addFieldConverter('app', function ($item){ return $item->appId ? $item->app->name : ''; });

		return $dataProvider;
	}

	protected function listHandler(ListHandler $list){
		$list->addJSPlugin('ListButtonAddNew');
		$list->add($this->id)->visible(false);
		$list->add(new Field('app', 'alkalmazás'))->sortable(false);
		$list->add($this->permission);
	}

	protected function formHandler(FormHandler $form){

		$apps = [];
		foreach(App::search()->asc('name')->collect() as $app) $apps[$app->id] = $app->name;

		$form->setLabelField($this->permission);
		$form->addJSPlugin('FormButtonDelete', 'FormButtonReload', 'FormButtonSave');
		$main = $form->section('');
		$main->input('string', $this->permission);
		$main->input('select', $this->appId)
		('options', $apps);
	}

}
