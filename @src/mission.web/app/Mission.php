<?php namespace Application\Mission\Web;

use Andesite\Ghost\GhostManager;
use Andesite\Mission\Web\Routing\Router;
use Andesite\Mission\Web\WebMission;

class Mission extends WebMission{

	public function route(Router $router){
		$router->api('/api',  __NAMESPACE__.'\\Api')();
		GhostManager::Module()->routeThumbnail($router);
		$router->get('/{app}', Page\Index::class)();
	}
}
