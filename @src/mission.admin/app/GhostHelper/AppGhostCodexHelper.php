<?php namespace Application\AdminCodex\GhostHelper;

use Andesite\Codex\Form\AdminDescriptor;
use Andesite\Codex\Form\DataProvider\GhostDataProvider;
use Andesite\Codex\Form\Field;
use Andesite\Codex\Interfaces\DataProviderInterface;

/**
 * @label-field id: 
 * @label-field name: kód
 * @label-field return: auth return url
 * @label-field title: név
 */
abstract class AppGhostCodexHelper extends AdminDescriptor{


	/** @var Field */ protected $id;
	/** @var Field */ protected $name;
	/** @var Field */ protected $return;
	/** @var Field */ protected $title;

	public function __construct(){
		$this->id = new Field('id', 'id');
		$this->name = new Field('name', 'kód');
		$this->return = new Field('return', 'auth return url');
		$this->title = new Field('title', 'név');
	}

	protected function createDataProvider(): DataProviderInterface{
		return new GhostDataProvider(\Application\Ghost\App::class);
	}

}
