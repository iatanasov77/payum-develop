<?php namespace App\Controller\TestTaxonomy;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use App\Entity\Taxonomy\Product;
use App\Form\TEST_ProductForm;

class ProductController extends Controller
{
    public function create()
    {
        $oProduct   = new Product();
        $form       = $this->createForm( TEST_ProductForm::class, $oProduct );
        
        
        return $this->render( 'pages/TestTaxonomy/create.html.twig', [
            'form'  => $form->createView(),
            'item'  => $oProduct
        ]);
    }
}
