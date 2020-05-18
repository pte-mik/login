<?php namespace Application\Ghost;

use Andesite\Attachment\AttachmentCategoryManager;
use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\DBAccess\Connection\Filter\Comparison;
use Andesite\DBAccess\Connection\Finder;
use Andesite\Ghost\Field;
use Andesite\Ghost\Ghost;
use Andesite\Ghost\Model;

/**
 * @method static GhostUserFinder search(Filter $filter = null)
 * @property-read $id
 * @property-write $password
 * @property-read AttachmentCategoryManager $avatar
 * @property-read \Application\Ghost\Permission[] $permissions
 * @method \Application\Ghost\Permission[] permissions($order = null, $limit = null, $offset = null)
 */
abstract class UserGhost extends Ghost{

	/** @var Model */
	public static $model;
	const Table = "user";
	const ConnectionName = "default";

		public static function f_id(){return new Comparison('id');}
		public static function f_name(){return new Comparison('name');}
		public static function f_email(){return new Comparison('email');}
		public static function f_login(){return new Comparison('login');}
		public static function f_displayNameHu(){return new Comparison('displayNameHu');}
		public static function f_displayNameEn(){return new Comparison('displayNameEn');}
		public static function f_neptun(){return new Comparison('neptun');}
		public static function f_groups(){return new Comparison('groups');}
		public static function f_password(){return new Comparison('password');}

	const V_groups_admin = "admin";
	const V_groups_user = "user";

	const F_id = "id";
	const F_name = "name";
	const F_email = "email";
	const F_login = "login";
	const F_displayNameHu = "displayNameHu";
	const F_displayNameEn = "displayNameEn";
	const F_neptun = "neptun";
	const F_groups = "groups";
	const F_password = "password";

	const A_avatar = "avatar";

	/** @var int $id */
	protected $id;
	/** @var string $name */
	public $name;
	/** @var string $email */
	public $email;
	/** @var string $login */
	public $login;
	/** @var string $displayNameHu */
	public $displayNameHu;
	/** @var string $displayNameEn */
	public $displayNameEn;
	/** @var string $neptun */
	public $neptun;
	/** @var array $groups */
	public $groups;
	/** @var string $password */
	protected $password;

	abstract protected function setPassword($value);

	final static protected function createModel(): Model{
		$model = new Model(get_called_class());
		$model->addField("id", Field::TYPE_ID,null);
		$model->addField("name", Field::TYPE_STRING,null);
		$model->addField("email", Field::TYPE_STRING,null);
		$model->addField("login", Field::TYPE_STRING,null);
		$model->addField("displayNameHu", Field::TYPE_STRING,null);
		$model->addField("displayNameEn", Field::TYPE_STRING,null);
		$model->addField("neptun", Field::TYPE_STRING,null);
		$model->addField("groups", Field::TYPE_SET,['admin','user']);
		$model->addField("password", Field::TYPE_STRING,null);
		$model->protectField("id");
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\Type('int'));
		$model->addValidator("id", new \Symfony\Component\Validator\Constraints\PositiveOrZero());
		$model->addValidator("name", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("name", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("email", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("email", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("login", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("login", new \Symfony\Component\Validator\Constraints\Length(['max'=>64]));
		$model->addValidator("displayNameHu", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("displayNameHu", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("displayNameEn", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("displayNameEn", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("neptun", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("neptun", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		$model->addValidator("groups", new \Symfony\Component\Validator\Constraints\Type('array'));
		$model->addValidator("groups", new \Symfony\Component\Validator\Constraints\Choice(['multiple'=>true,'choices'=>['admin','user']]));
		$model->addValidator("password", new \Symfony\Component\Validator\Constraints\Type('string'));
		$model->addValidator("password", new \Symfony\Component\Validator\Constraints\Length(['max'=>255]));
		return $model;
	}
}

/**
 * Nobody uses this class, it exists only to help the code completion
 * @method \Application\Ghost\User[] collect($limit = null, $offset = null)
 * @method \Application\Ghost\User[] collectPage($pageSize, $page, &$count = 0)
 * @method \Application\Ghost\User pick()
 */
abstract class GhostUserFinder extends Finder {}