<?php namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

use App\Entity\Taxonomy\Taxon;
use App\Entity\Taxonomy\TaxonTranslation;
use Doctrine\ORM\EntityRepository;

class TEST_ProductForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        
        $builder
            ->add( 'taxons', EntityType::class, [    // 'sylius_taxon_choice'
                'class'     => Taxon::class,
                
                'query_builder' => function ( EntityRepository $er ) {
                    $rootTaxon  = $er->find( 4 );
                    
                    return $er->createQueryBuilder( 't' )
                        ->where( 't.root = :rootTaxon' )
                        ->setParameter( 'rootTaxon', $rootTaxon );
                        //->orderBy( 't.name', 'ASC' );
                },
                
                'label'     => 'Categories',
                'multiple'  => true
            ])
            
            ->add( 'name', TextType::class, ['label' => 'Name'] )
            
            ->add( 'btnApply', SubmitType::class, ['label' => 'Apply'] )
            ->add( 'btnSave', SubmitType::class, ['label' => 'Save'] )
            ->add( 'btnCancel', ButtonType::class, ['label' => 'Cancel'] )
        ;
    }
    
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver
            ->setDefaults(array(
                'data_class' => 'App\Entity\Taxonomy\Product'
            ))
        ;
    }
}
