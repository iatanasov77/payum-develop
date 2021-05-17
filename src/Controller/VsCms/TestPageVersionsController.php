<?php namespace App\Controller\VsCms;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Cms\TestPageVersion;

class TestPageVersionsController extends Controller
{
    /**
     * @Route("/admin/test/page_versions/list", name="app_test_page_versions_list")
     */
    public function listVersions( Request $request )
    {
        $erLogs         = $this->getDoctrine()->getRepository( 'App\Entity\LogEntry' );
        $er             = $this->getDoctrine()->getRepository( TestPageVersion::class );
        
        $pages          = $er->findAll();
        $versions       = [];
        foreach ( $pages as $page ) {
            $versions[$page->getId()]  = $erLogs->getLogEntries( $page );
        }
        //var_dump( $versions ); die;
        
        return $this->render( 'admin/VsCms/TestPagesVersions/index.html.twig', [
            'pages'     => $pages,
            'versions'  => $versions,
        ]);
    }
    
    /**
     * @Route("/test/page_versions/{id}/revert_to/{version}", name="app_test_page_versions_revert")
     */
    public function revertVersion( $id, $version, Request $request )
    {
        $em     = $this->getDoctrine()->getManager();
        $er     = $this->getDoctrine()->getRepository( TestPageVersion::class );
        $erLogs = $this->getDoctrine()->getRepository( 'App\Entity\LogEntry' );
        $page   = $er->find( $id );
        
        // lets revert to first version
        $erLogs->revertByLocale($page, 1/*version*/, $request->getLocale());
        
        // notice page is not persisted yet, you need to persist and flush it
        $em->persist($page);
        $em->flush();
        
        return new JsonResponse(['data' => 123]);
    }
    
    /**
     * @Route("/test/page_version/create/{title}", name="app_test_page_version_create_page")
     */
    public function create( $title, Request $request )
    {
        $em         = $this->getDoctrine()->getManager();
        
        $page       = new TestPageVersion();
        $page->setTitle( $title );
        $em->persist( $page );
        $em->flush();
        
        return new JsonResponse( ['status' => 'SUCCESS']);
    }
    
    /**
     * @Route("/test/page_version/create_new_version/{id}/{newTitle}", name="app_test_page_version_create_page_new_version")
     */
    public function createNewVersion( $id, $newTitle, Request $request )
    {
        $er         = $this->getDoctrine()->getRepository( TestPageVersion::class );
        $em         = $this->getDoctrine()->getManager();
        
        $page       = $er->find( $id );
        $page->setTitle( $newTitle );
        $em->persist( $page );
        $em->flush();
        
        return new JsonResponse( ['status' => 'SUCCESS']);
    }
}
