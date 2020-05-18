<?php namespace Application\AdminCodex\GhostHelper;

use Andesite\Codex\Form\AdminDescriptor;
use Andesite\Codex\Form\DataProvider\GhostDataProvider;
use Andesite\Codex\Form\Field;
use Andesite\Codex\Interfaces\DataProviderInterface;

/**
 * @label-field id: 
 * @label-field permission: jogosultság
 * @label-field appId: alkalmazás
 */
abstract class AppPermissionGhostCodexHelper extends AdminDescriptor{


	/** @var Field */ protected $id;
	/** @var Field */ protected $permission;
	/** @var Field */ protected $appId;

	public function __construct(){
		$this->id = new Field('id', 'id');
		$this->permission = new Field('permission', 'jogosultság');
		$this->appId = new Field('appId', 'alkalmazás');
	}

	protected function createDataProvider(): DataProviderInterface{
		return new GhostDataProvider(\Application\Ghost\AppPermission::class);
	}

}
