<?php namespace App\Controller\VsUsers;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class NewsletterSubscriptionController extends Controller
{
    /**
     * @Route("/newsletter/mailchimp/subscribe", name="app_newsletter_mailchimp_subscribe")
     */
    public function subscribe( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_SUPER_ADMIN' );
        
        $response = new Response( '<h1>Super Admin Allowed</h1>' );
        return $response;
    }
    
    /**
     * @Route("/newsletter/mailchimp/unsubscribe", name="app_newsletter_mailchimp_unsubscribe")
     */
    public function unsubscribe( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_ADMIN' );
        
        $response = new Response( '<h1>Admin Allowed</h1>' );
        return $response;
    }
}
