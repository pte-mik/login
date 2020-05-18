<?php namespace Application\Mission\Web\Page;

use Andesite\DBAccess\Connection\Filter\Filter;
use Andesite\TwigResponder\Responder\SmartPageResponder;
use Application\Ghost\App;

/**
 * @template "index.twig"
 * @title "PTE MIK LOGIN"
 * @bodyclass ""
 * @js "/~web/app.js"
 * @css "/~web/app.css"
 */
class Index extends SmartPageResponder
{

	protected function prepare(){
		$app = App::search(Filter::where(App::f_name()->is($this->getPathBag()->get('app'))))->pick();
		$this->set('app', $app);
		$this->set('params', $this->getQueryBag()->all());
	}

}