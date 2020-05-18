<?php namespace Application\AdminCodex\GhostHelper;

use Andesite\Codex\Form\AdminDescriptor;
use Andesite\Codex\Form\DataProvider\GhostDataProvider;
use Andesite\Codex\Form\Field;
use Andesite\Codex\Interfaces\DataProviderInterface;

/**
 * @label-field id: 
 * @label-field name: név
 * @label-field email: e-mail
 * @label-field login: login (eha/neptun)
 * @label-field displayNameHu: magyar név
 * @label-field displayNameEn: angol név
 * @label-field neptun: neptun
 * @label-field groups: csoportok
 * @label-field groups.admin: 
 * @label-field groups.user: 
 * @label-field password: 
 * @label-attachment avatar: 
 */
abstract class UserGhostCodexHelper extends AdminDescriptor{


	/** @var Field */ protected $id;
	/** @var Field */ protected $name;
	/** @var Field */ protected $email;
	/** @var Field */ protected $login;
	/** @var Field */ protected $displayNameHu;
	/** @var Field */ protected $displayNameEn;
	/** @var Field */ protected $neptun;
	/** @var Field */ protected $groups;
	/** @var Field */ protected $password;
	/** @var Field */ protected $avatar;

	public function __construct(){
		$this->id = new Field('id', 'id');
		$this->name = new Field('name', 'név');
		$this->email = new Field('email', 'e-mail');
		$this->login = new Field('login', 'login (eha/neptun)');
		$this->displayNameHu = new Field('displayNameHu', 'magyar név');
		$this->displayNameEn = new Field('displayNameEn', 'angol név');
		$this->neptun = new Field('neptun', 'neptun');
		$this->groups = new Field('groups', 'csoportok', ['admin'=>'admin', 'user'=>'user']);
		$this->password = new Field('password', 'password');
		$this->avatar = new Field('avatar', 'avatar');
	}

	protected function createDataProvider(): DataProviderInterface{
		return new GhostDataProvider(\Application\Ghost\User::class);
	}

}
