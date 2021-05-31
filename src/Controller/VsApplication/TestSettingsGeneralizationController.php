<?php namespace App\Controller\VsApplication;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Cache\Adapter\FilesystemAdapter;

class TestSettingsGeneralizationController extends Controller
{
    /**
     * @Route("/settings/test_generalization/{siteId}", name="app_settings_test_generalization")
     */
    public function testSiteSettingsGeneralization( $siteId, Request $request ) : Response
    {
        $this->clearCache( $siteId );
        
        $settingsManager    = $this->get( 'vs_app.settings_manager' );
        
        $settings           = $settingsManager->getSettings( $siteId );
        
        return new JsonResponse( $settings );
    }
    
    private function clearCache( $siteId )
    {
        $this->get( 'vs_app.settings_manager' )->clearCache( $siteId );
    }
}
