<?php namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ButtonType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

use Symfony\Component\Validator\Constraints\NotBlank;

use App\Entity\UsersSubscriptions\MailchimpAudience;

class MailchimpSubscriptionForm extends AbstractType
{
    public function buildForm( FormBuilderInterface $builder, array $options )
    {
        $builder
 
            ->add( 'email', EmailType::class, [
                'label'     => 'Email Address',
                'attr' => [
                    'placeholder' => 'Email Address to Subscribe',
                ],
                'constraints'   => [
                    new NotBlank([
                        'message' => 'Please enter a valid email address',
                    ]),
                ],
            ])

            ->add( 'audience', EntityType::class, [
                'label'         => 'Mailchimp Audience',
                'class'         => MailchimpAudience::class,
                'choice_label'  => 'description',
            ])
            ->add( 'tags', TextType::class, ['label' => 'Audience Tags'] )
            
            ->add( 'firstName', TextType::class, ['label' => 'First Name'] )
            ->add( 'lastName', TextType::class, ['label' => 'Last Name'] )
            
            ->add( 'btnSave', SubmitType::class, ['label' => 'Save'] )
            ->add( 'btnCancel', ButtonType::class, ['label' => 'Cancel'] )
        ;
    }
}
