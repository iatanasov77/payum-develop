<?php namespace App\Controller\VsCassandra;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Cassandra\Product;

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
        //echo "<pre>"; var_dump($products); die;
        
        return $this->render( 'admin/VsCassandra/Product/index.html.twig', [
            'items'  => $products
        ]);
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
        $product    = new Product();
        
        $product->title = 'A Foo Bar';
        $product->price = '19.99';
        $product->qty   = 30;
        
        return $this->render( 'admin/VsCassandra/Product/create.html.twig', [
            'message'  => 'Created product id ' . $product->productId
        ]);
    }
}
