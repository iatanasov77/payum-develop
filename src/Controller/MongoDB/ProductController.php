<?php namespace App\Controller\MongoDB;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ODM\MongoDB\DocumentManager;

use App\Entity\MongoDB\Product;

class ProductController extends Controller
{
    /**
     * @Route("/mongodb/products", name="app_mongodb_product_index")
     */
    public function indexAction( Request $request )
    {
        $dm = $this->get( 'doctrine_mongodb.odm.default_document_manager' );
        
        $products = $dm->getRepository( Product::class )->findAll();
        var_dump( $products ); die;
    }
    
    /**
     * @Route("/mongodb/products/new", name="app_mongodb_product_create")
     */
    public function createAction( DocumentManager $dm, Request $request )
    {
        $product    = new Product();
        
        $product->setName( 'A Foo Bar' );
        $product->setPrice( '19.99' );
        
        $dm->persist( $product );
        $dm->flush();
        
        return new Response( 'Created product id ' . $product->getId() );
    }
}
