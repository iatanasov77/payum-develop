<?php namespace App\Controller\VsUsers;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class NewsletterSubscriptionController extends Controller
{
    /**
     * @Route("/super_admin_only", name="app_page_super_admin_only")
     */
    public function subscribe( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_SUPER_ADMIN' );
        
        $response = new Response( '<h1>Super Admin Allowed</h1>' );
        return $response;
    }
    
    /**
     * @Route("/admin_only", name="app_page_admin_only")
     */
    public function unsubscribe( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_ADMIN' );
        
        $response = new Response( '<h1>Admin Allowed</h1>' );
        return $response;
    }
}
