<?php

namespace WHMCS\Module\Addon\IspapiDomainImport\Admin;

/**
 * Sample Admin Area Dispatch Handler
 */
class AdminDispatcher {

    /**
     * Dispatch request.
     *
     * @param string $action
     * @param array $args
     *
     * @return string
     */
    public function dispatch($action, $args, $smarty)
    {
        if (!$action){
            $action = 'index';
        }
        else {
            $action = strtolower(preg_replace("/\s/", "", $action));
        }
        $controller = new Controller();
        // Verify requested action is valid and callable
        if (is_callable(array($controller, $action))) {
            return $controller->$action($args, $smarty);
        }
        // action error
        $smarty->assign("error", $args['_lang']['actionerror']);
        return $smarty->fetch('error.tpl');
    }
}