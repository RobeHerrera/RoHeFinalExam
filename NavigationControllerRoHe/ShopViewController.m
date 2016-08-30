//
//  ShopViewController.m
//  ProyectoJoyas
//
//  Created by RobertoHerrera on 8/24/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()
@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lblProduct.text        = self.stuffNames;
    self.PriceProduct.text      = self.stuffPrices;
    self.imgProduct.image   = [UIImage imageNamed:self.stuffImgs];
    self.MaterialProduct.text   = self.stuffMaterial;
    if ([self.lblProduct  isEqual: @"Anillos de matrimonio"]) {
        self.DesProduct.text   = @"El anillo de bodas, llamado también alianza de matrimonio, es un aro normalmente liso en el cual, y en la parte interior, se graban los nombres de quienes contraen matrimonio. Este anillo suele hacerse en oro, siendo la pureza del oro de 18 quilates en España, 22 o 24 en los países árabes y de menor en otros países como Alemania.";
        
    }else if ([self.stuffNames  isEqual: @"Aretes"]) {
       self.DesProduct.text   = @"El arete con su colgante figuraba a menudo en los relieves de personajes asirios pero no se observa en los de Egipto donde parece que no estuvieron muy en boga los pendientes. No obstante, se han encontrado preciosos ejemplares en tumbas de princesas de las dinastías XII y XIII y de faraones de la XX entre otros. De egipcios y asirios copiaron la forma los fenicios, hebreos y otros pueblos orientales. La misma costumbre adoptaron los griegos y romanos, labrando pendientes de singular riqueza con aretes de oro y colgantes de perlas, gemas y pequeñas cabezas de metal siendo su uso propio de las mujeres, como en los demás países de Occidente. Sin embargo, solían llevar pendientes también los niños de Atenas y Roma aunque sólo en una oreja.";
        
    }else if ([self.stuffNames  isEqual: @"Collar Artesanal"]) {
        self.DesProduct.text   = @"Se le ha considerado normalmente como adorno de mujeres, pero lejos de ser exclusivo, han usado de él también los varones en los pueblos indígenas y en las civilizaciones antiguas de Oriente y Egipto (apenas en las de Grecia) en las de Etruria y Roma, en el Imperio bizantino y algo en el Occidente medieval (por lo menos, en el siglo XIV), cesando en Europa desde el siglo XV para los hombres, salvo para uso como condecoración honorífica. \nSe le ha considerado normalmente como adorno de mujeres, pero lejos de ser exclusivo, han usado de él también los varones en los pueblos indígenas y en las civilizaciones antiguas de Oriente y Egipto (apenas en las de Grecia) en las de Etruria y Roma, en el Imperio bizantino y algo en el Occidente medieval (por lo menos, en el siglo XIV), cesando en Europa desde el siglo XV para los hombres, salvo para uso como condecoración honorífica.";
        
    }else if ([self.stuffNames  isEqual: @"Dijes & Nombres"]) {
        self.DesProduct.text   = @"Que son los dijes ya de pequeña dimensión provista de un pequeño aro para ser colgada a una cadena.\n Consta que usaban los reyes y magnates asirios y persas vajillas de oro y plata, dijes y adornos de inestimable precio, carruajes y aparejos de montura cuajados de oro y plata, sillas o tornos, mesas y lechos de preciosos metales o de bronce dorado, etc.\nEntre las piezas metálicas de alguna importancia que se han descubierto en las ruinas de sus antiguas ciudades se cuentan principalmente:";
        
    }else if ([self.stuffNames  isEqual: @"Esclavas Personalizadas"]) {
        self.DesProduct.text   = @"El origen de las pulseras esclavas está basado en una leyenda Índia y significa cada mujer india al casarse con un indio recibía una pulsera hecha con ramas o plantas la cual pactaba fidelidad a él, los indios tenían muchos enfrentamientos con conquistadores que venían a usurparles las tierras, los cuales muchos perdían la vida en esas peleas, entonces la mujer india al morir el marido podía casarse con otro, el cual le ponía otra pulsera (esclava), las mujeres indias no podían tener mas de tres esclavas, si llegaban al tercer compromiso eran sacrificadas en nombre de los maridos que eran guerreros caídos en guerras por defender sus tierras.";
        
    }else if ([self.stuffNames  isEqual: @"Juegos Completos"]) {
        self.DesProduct.text   = @"Los primeros hallazgos de orfebrería son sencillas piezas de cobre que datan del final del periodo neolítico seguidas muy pronto de las de oro, plata y bronce, al abrirse la edad que recibe el nombre de este último metal. Los objetos que se labraron con dichos materiales consistían en diademas lisas a modo de cinta, gruesos brazaletes y collares rígidos (o torques) de una pieza, terminada por bolas piriformes, otros collares formados por sartas de bolitas perforadas y, en fin, anillos y pendientes de forma circular sencilla. La ornamentación de tales preseas, cuando existe, es puramente geométrica y se limita a surquillos rectos y en zig-zag, dientes, circulillos, puntos hechos a martillo, etc. Como cosa excepcional, se existe del antiguo Egipto algún cuchillo de sílex con guarnición y vaina de oro, ornamentadas con florones y figuras de animales. Se labraron también de cobre y de bronce agujas, cuchillos y armas diferentes en forma de flechas, espadas y hachas con alguna ornamentación geométrica en el puño y con un temple y corte bastante fino en la hoja.";
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnPressBack:(id)sender {
    [self performSegueWithIdentifier:@"Home" sender:self];
}


////////////////////////////////////////////////////////////////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.destinationViewController isKindOfClass:[Home class]]) {
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _payPalConfiguration = [[PayPalConfiguration alloc] init];
        
        // See PayPalConfiguration.h for details and default values.
        // Should you wish to change any of the values, you can do so here.
        // For example, if you wish to accept PayPal but not payment card payments, then add:
        _payPalConfiguration.acceptCreditCards = NO;
        // Or if you wish to have the user choose a Shipping Address from those already
        // associated with the user's PayPal account, then add:
        _payPalConfiguration.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    }
    return self;
}
- (IBAction)changeLblTotal{
   // self.lblTotal.text = (NSString)self.stuffPrices.intValue;
    NSUInteger valor = [[self.textQuant text] integerValue];
    self.lblTotal.text = [NSString stringWithFormat:@"%lu", (self.stuffPrices.intValue * valor)];
    
}

- (IBAction)pay {
    
    // Create a PayPalPayment
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    
    // Amount, currency, and description
    payment.amount = [[NSDecimalNumber alloc] initWithString:self.lblTotal.text ];
    payment.currencyCode = @"MXN";
    payment.shortDescription = self.lblProduct.text;
    
    // Use the intent property to indicate that this is a "sale" payment,
    // meaning combined Authorization + Capture.
    // To perform Authorization only, and defer Capture to your server,
    // use PayPalPaymentIntentAuthorize.
    // To place an Order, and defer both Authorization and Capture to
    // your server, use PayPalPaymentIntentOrder.
    // (PayPalPaymentIntentOrder is valid only for PayPal payments, not credit card payments.)
    payment.intent = PayPalPaymentIntentSale;
    
    // If your app collects Shipping Address information from the customer,
    // or already stores that information on your server, you may provide it here.
   // payment.shippingAddress. = address; // a previously-created PayPalShippingAddress object
    
    // Several other optional fields that you can set here are documented in PayPalPayment.h,
    // including paymentDetails, items, invoiceNumber, custom, softDescriptor, etc.
    
    // Check whether payment is processable.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    
    // continued below..
    // ...continued from above
    
    // Create a PayPalPaymentViewController.
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                   configuration:self.payPalConfiguration
                                                                        delegate:self];
    
    // Present the PayPalPaymentViewController.
    [self presentViewController:paymentViewController animated:YES completion:nil];
}
#pragma mark - PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController
                 didCompletePayment:(PayPalPayment *)completedPayment {
    // Payment was processed successfully; send to server for verification and fulfillment.
    [self verifyCompletedPayment:completedPayment];
    
    // Dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

// SomeViewController.m

- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment {
    // Send the entire confirmation dictionary
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation
                                                           options:0
                                                             error:nil];
    
    // Send confirmation to your server; your server should verify the proof of payment
    // and give the user their goods or services. If the server is not reachable, save
    // the confirmation and try again later.
}
@end
