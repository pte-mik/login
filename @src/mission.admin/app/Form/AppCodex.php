<?php namespace Application\AdminCodex\Form;

use Andesite\Codex\Form\Field;
use Andesite\Codex\Form\FormDecorator;
use Andesite\Codex\Form\FormHandler\FormHandler;
use Andesite\Codex\Form\ListHandler\ListHandler;
use Andesite\Codex\Interfaces\DataProviderInterface;
use Application\AdminCodex\GhostHelper\AppGhostCodexHelper;
use Application\Component\Constant\Permission\Role;

class AppCodex extends AppGhostCodexHelper{

	protected function decorator(FormDecorator $decorator){
		$decorator->setIcons('fal fa-browser');
		$decorator->setTitle('Applikációk');
		$decorator->setRole(Role::Admin);
	}

	protected function createDataProvider(): DataProviderInterface{
		$dataProvider = parent::createDataProvider();
		return $dataProvider;
	}

	protected function listHandler(ListHandler $list){
		$list->addJSPlugin('ListButtonAddNew');
		$list->add($this->id)->visible(false);
		$list->add($this->title);
		$list->add($this->name);
	}

	protected function formHandler(FormHandler $form){
		$form->setLabelField($this->name);
		$form->addJSPlugin('FormButtonDelete', 'FormButtonReload', 'FormButtonSave');
		$main = $form->section('');
		$main->input('string', $this->name);
		$main->input('string', $this->title);
		$main->input('string', $this->return);
	}

}
