<?php  namespace App\Controller\VsCms;

use Symfony\Component\HttpFoundation\Request;
use VS\CmsBundle\Controller\PagesCategoryController as BasePagesCategoryController;
use VS\ApplicationBundle\Controller\TaxonomyHelperTrait;

use App\Entity\Taxonomy\Taxon;

class PagesCategoryController extends BasePagesCategoryController
{
    use TaxonomyHelperTrait;
    
    protected function prepareEntity( &$entity, &$form, Request $request )
    {
        /*
         * @WORKAROUND Create Taxon If not exists
         */
        if ( ! $entity->getTaxon() ) {
            $newTaxon   = $this->createTaxon(
                $form['name']->getData(),
                $form['currentLocale']->getData(),
                $entity->getParent() ? $entity->getParent()->getTaxon() : null,
                $this->getParameter( 'vs_cms.page_categories.taxonomy_id' )
                );
            
            $entity->setTaxon( $newTaxon );
        }
    }
}
