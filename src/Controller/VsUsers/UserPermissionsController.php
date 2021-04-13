<?php namespace App\Controller\VsUsers;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class UserPermissionsController extends Controller
{
    /**
     * @Route("/super_admin_only", name="app_page_super_admin_only")
     */
    public function requireSuperAdmin( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_SUPER_ADMIN' );
        
        $response = new Response( '<h1>Super Admin Allowed</h1>' );
        return $response;
    }
    
    /**
     * @Route("/admin_only", name="app_page_admin_only")
     */
    public function requireAdmin( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_ADMIN' );
        
        $response = new Response( '<h1>Admin Allowed</h1>' );
        return $response;
    }
    
    /**
     * @Route("/specific_role_1_only", name="app_page_specific_role_1_only")
     */
    public function requireSpecificRole_1( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_SPECIFIC_1' );
        
        $response = new Response( '<h1>Role-1 Allowed</h1>' );
        return $response;
    }
    
    /**
     * @Route("/specific_role_2_only", name="app_page_specific_role_2_only")
     */
    public function requireSpecificRole_2( Request $request ) : Response
    {
        $this->denyAccessUnlessGranted( 'ROLE_SPECIFIC_2' );
        
        $response = new Response( '<h1>Role-2 Allowed</h1>' );
        return $response;
    }
}
