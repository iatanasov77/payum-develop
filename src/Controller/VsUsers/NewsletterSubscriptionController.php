<?php namespace App\Controller\VsUsers;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

use VS\ApplicationBundle\Component\Status;
use VS\UsersSubscriptionsBundle\Component\Exception\SubscriberException;
use App\Form\MailchimpSubscriptionForm;
use App\Entity\UsersSubscriptions\NewsletterSubscription;

class NewsletterSubscriptionController extends Controller
{
    /**
     * @Route("/newsletter/mailchimp/subscribe", name="app_newsletter_mailchimp_subscribe")
     */
    public function subscribe( Request $request ) : Response
    {
        $form   = $this->createForm( MailchimpSubscriptionForm::class, null, [
            'action' => $this->generateUrl( 'app_newsletter_mailchimp_subscribe' ),
            'method' => 'POST'
        ]);
        
        $form->handleRequest( $request );
        if( $form->isSubmitted() ) {
            $subscriber = $this->get( 'vs_users_subscriptions.newsletter.mailchimp.subscriber' );
            $em         = $this->getDoctrine()->getManager();
            
            $postData   = $form->getData();
            $fields     = [
                'FNAME' => $postData['firstName'],
                'LNAME' => $postData['lastName'],
            ];
            $options    = [
                'language'  => $request->getLocale(),
                'tags'      => explode( ',', $postData['tags'] ) ?: [] // ['VS_SymfonyBlogExample']
            ];
            
            $mailchimResponse   = false;
            try {
                $mailchimResponse   = $subscriber->subscribe(
                    $postData['audience']->getAudienceId(),
                    $postData['email'],
                    $fields,
                    $options
                );
            } catch ( SubscriberException $e ) {
                return new JsonResponse( ['status' => Status::STATUS_ERROR, 'message' => $e->getMessage()] );
            }
            
            if ( $mailchimResponse ) {
                $subscription   = new NewsletterSubscription();
                
                $subscription->setUserEmail( $postData['email'] );
                $subscription->setMailchimpAudience( $postData['audience'] );
                
                $em->persist( $subscription );
                $em->flush();
            }
            
            return new JsonResponse( ['status' => Status::STATUS_OK] );
        }
        
        return $this->render( 'admin/form/mailchimp_subscription.html.twig', [
            'form'  => $form->createView(),
        ]);
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
