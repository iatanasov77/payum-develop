<?php namespace App\Controller\VsCassandra;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends Controller
{
    /**
     * @Route("/cassandra/products", name="app_cassandra_product_index")
     */
    public function index( Request $request ): Response
    {
        //$er         = $this->getDoctrine()->getRepository( ProjectCategory::class );
        $repo		= $this->container->get( 'app.cassandra.repository' )->get( 'Main::Products' );
        
        $products	= $repo->find();
        
        echo "<pre>"; var_dump($products); die;
        
        
        //         return $this->render( 'website/pages/home.html.twig', [
        //             'categories'    => $er->findAll(),
        //             'repository'    => $er
        //         ]);
    }
    
    /**
     * @Route("/cassandra/products/new", name="app_cassandra_product_create")
     */
    public function createAction( Request $request )
    {
        
    }
}
