//
//  UIColor+Help.h
//  2014_12_06_photo
//
//  Created by xiaoxiaobing on 14-12-16.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define XXBColor(r,g,b) [UIColor colorWithRed:((r)/255.0) green:((g)/255.0) blue:((b)/255.0) alpha:1.0]

@interface UIColor (Help)

/**
 *  随机色
 *
 *  @return 返回随机色
 */
+ (UIColor *)myRandomColor;


#pragma mark -  github 上找的
+ (instancetype)crayolaAbsoluteZeroColor;
+ (instancetype)crayolaAlienArmpitColor;
+ (instancetype)crayolaAlloyOrangeColor;
+ (instancetype)crayolaAlmondColor;
+ (instancetype)crayolaAmethystColor;
+ (instancetype)crayolaAntiqueBrassColor;
+ (instancetype)crayolaApricotColor;
+ (instancetype)crayolaAquaPearlColor;
+ (instancetype)crayolaAquamarineColor;
+ (instancetype)crayolaAsparagusColor;
+ (instancetype)crayolaAtomicTangerineColor;
+ (instancetype)crayolaAztecGoldColor;
+ (instancetype)crayolaBabyPowderColor;
+ (instancetype)crayolaBananaColor;
+ (instancetype)crayolaBananaManiaColor;
+ (instancetype)crayolaBdazzledBlueColor;
+ (instancetype)crayolaBeaverColor;
+ (instancetype)crayolaBigDipORubyColor;
+ (instancetype)crayolaBigFootFeetColor;
+ (instancetype)crayolaBittersweetColor;
+ (instancetype)crayolaBittersweetShimmerColor;
+ (instancetype)crayolaBlackColor;
+ (instancetype)crayolaBlackCoralPearlColor;
+ (instancetype)crayolaBlackShadowsColor;
+ (instancetype)crayolaBlastOffBronzeColor;
+ (instancetype)crayolaBlizzardBlueColor;
+ (instancetype)crayolaBlueColor;
+ (instancetype)crayolaBlueBellColor;
+ (instancetype)crayolaBlueGrayColor;
+ (instancetype)crayolaBlueGreenColor;
+ (instancetype)crayolaBlueJeansColor;
+ (instancetype)crayolaBlueVioletColor;
+ (instancetype)crayolaBlueberryColor;
+ (instancetype)crayolaBlushColor;
+ (instancetype)crayolaBoogerBusterColor;
+ (instancetype)crayolaBrickRedColor;
+ (instancetype)crayolaBrightYellowColor;
+ (instancetype)crayolaBrownColor;
+ (instancetype)crayolaBrownSugarColor;
+ (instancetype)crayolaBubbleGumColor;
+ (instancetype)crayolaBurnishedBrownColor;
+ (instancetype)crayolaBurntOrangeColor;
+ (instancetype)crayolaBurntSiennaColor;
+ (instancetype)crayolaCadetBlueColor;
+ (instancetype)crayolaCanaryColor;
+ (instancetype)crayolaCaribbeanGreenColor;
+ (instancetype)crayolaCaribbeanGreenPearlColor;
+ (instancetype)crayolaCarnationPinkColor;
+ (instancetype)crayolaCedarChestColor;
+ (instancetype)crayolaCeriseColor;
+ (instancetype)crayolaCeruleanColor;
+ (instancetype)crayolaCeruleanFrostColor;
+ (instancetype)crayolaCherryColor;
+ (instancetype)crayolaChestnutColor;
+ (instancetype)crayolaChocolateColor;
+ (instancetype)crayolaCinnamonSatinColor;
+ (instancetype)crayolaCitrineColor;
+ (instancetype)crayolaCoconutColor;
+ (instancetype)crayolaCopperColor;
+ (instancetype)crayolaCopperPennyColor;
+ (instancetype)crayolaCornflowerColor;
+ (instancetype)crayolaCosmicCobaltColor;
+ (instancetype)crayolaCottonCandyColor;
+ (instancetype)crayolaCulturedPearlColor;
+ (instancetype)crayolaCyberGrapeColor;
+ (instancetype)crayolaDaffodilColor;
+ (instancetype)crayolaDandelionColor;
+ (instancetype)crayolaDeepSpaceSparkleColor;
+ (instancetype)crayolaDenimColor;
+ (instancetype)crayolaDenimBlueColor;
+ (instancetype)crayolaDesertSandColor;
+ (instancetype)crayolaDingyDungeonColor;
+ (instancetype)crayolaDirtColor;
+ (instancetype)crayolaEerieBlackColor;
+ (instancetype)crayolaEggplantColor;
+ (instancetype)crayolaElectricLimeColor;
+ (instancetype)crayolaEmeraldColor;
+ (instancetype)crayolaEucalyptusColor;
+ (instancetype)crayolaFernColor;
+ (instancetype)crayolaFieryRoseColor;
+ (instancetype)crayolaForestGreenColor;
+ (instancetype)crayolaFreshAirColor;
+ (instancetype)crayolaFrostbiteColor;
+ (instancetype)crayolaFuchsiaColor;
+ (instancetype)crayolaFuzzyWuzzyColor;
+ (instancetype)crayolaGargoyleGasColor;
+ (instancetype)crayolaGiantsClubColor;
+ (instancetype)crayolaGlossyGrapeColor;
+ (instancetype)crayolaGoldColor;
+ (instancetype)crayolaGoldFusionColor;
+ (instancetype)crayolaGoldenrodColor;
+ (instancetype)crayolaGraniteGrayColor;
+ (instancetype)crayolaGrannySmithAppleColor;
+ (instancetype)crayolaGrapeColor;
+ (instancetype)crayolaGrayColor;
+ (instancetype)crayolaGreenColor;
+ (instancetype)crayolaGreenBlueColor;
+ (instancetype)crayolaGreenLizardColor;
+ (instancetype)crayolaGreenSheenColor;
+ (instancetype)crayolaGreenYellowColor;
+ (instancetype)crayolaHeatWaveColor;
+ (instancetype)crayolaHotMagentaColor;
+ (instancetype)crayolaIlluminatingEmeraldColor;
+ (instancetype)crayolaInchwormColor;
+ (instancetype)crayolaIndigoColor;
+ (instancetype)crayolaJadeColor;
+ (instancetype)crayolaJasperColor;
+ (instancetype)crayolaJazzberryJamColor;
+ (instancetype)crayolaJellyBeanColor;
+ (instancetype)crayolaJungleGreenColor;
+ (instancetype)crayolaKeyLimePearlColor;
+ (instancetype)crayolaLapisLazuliColor;
+ (instancetype)crayolaLaserLemonColor;
+ (instancetype)crayolaLavenderColor;
+ (instancetype)crayolaLeatherJacketColor;
+ (instancetype)crayolaLemonColor;
+ (instancetype)crayolaLemonGlacierColor;
+ (instancetype)crayolaLemonYellowColor;
+ (instancetype)crayolaLicoriceColor;
+ (instancetype)crayolaLilacColor;
+ (instancetype)crayolaLilacLusterColor;
+ (instancetype)crayolaLimeColor;
+ (instancetype)crayolaLumberColor;
+ (instancetype)crayolaMacaroniCheeseColor;
+ (instancetype)crayolaMagentaColor;
+ (instancetype)crayolaMagicMintColor;
+ (instancetype)crayolaMagicPotionColor;
+ (instancetype)crayolaMahoganyColor;
+ (instancetype)crayolaMaizeColor;
+ (instancetype)crayolaMalachiteColor;
+ (instancetype)crayolaManateeColor;
+ (instancetype)crayolaMandarinPearlColor;
+ (instancetype)crayolaMangoTangoColor;
+ (instancetype)crayolaMaroonColor;
+ (instancetype)crayolaMauvelousColor;
+ (instancetype)crayolaMelonColor;
+ (instancetype)crayolaMetallicSeaweedColor;
+ (instancetype)crayolaMetallicSunburstColor;
+ (instancetype)crayolaMidnightBlueColor;
+ (instancetype)crayolaMidnightPearlColor;
+ (instancetype)crayolaMistyMossColor;
+ (instancetype)crayolaMoonstoneColor;
+ (instancetype)crayolaMountainMeadowColor;
+ (instancetype)crayolaMulberryColor;
+ (instancetype)crayolaMummysTombColor;
+ (instancetype)crayolaMysticMaroonColor;
+ (instancetype)crayolaMysticPearlColor;
+ (instancetype)crayolaNavyBlueColor;
+ (instancetype)crayolaNeonCarrotColor;
+ (instancetype)crayolaNewCarColor;
+ (instancetype)crayolaOceanBluePearlColor;
+ (instancetype)crayolaOceanGreenPearlColor;
+ (instancetype)crayolaOgreOdorColor;
+ (instancetype)crayolaOliveGreenColor;
+ (instancetype)crayolaOnyxColor;
+ (instancetype)crayolaOrangeColor;
+ (instancetype)crayolaOrangeRedColor;
+ (instancetype)crayolaOrangeSodaColor;
+ (instancetype)crayolaOrangeYellowColor;
+ (instancetype)crayolaOrchidColor;
+ (instancetype)crayolaOrchidPearlColor;
+ (instancetype)crayolaOuterSpaceColor;
+ (instancetype)crayolaOutrageousOrangeColor;
+ (instancetype)crayolaPacificBlueColor;
+ (instancetype)crayolaPeachColor;
+ (instancetype)crayolaPearlyPurpleColor;
+ (instancetype)crayolaPeridotColor;
+ (instancetype)crayolaPeriwinkleColor;
+ (instancetype)crayolaPewterBlueColor;
+ (instancetype)crayolaPiggyPinkColor;
+ (instancetype)crayolaPineColor;
+ (instancetype)crayolaPineGreenColor;
+ (instancetype)crayolaPinkFlamingoColor;
+ (instancetype)crayolaPinkPearlColor;
+ (instancetype)crayolaPinkSherbertColor;
+ (instancetype)crayolaPixiePowderColor;
+ (instancetype)crayolaPlumColor;
+ (instancetype)crayolaPlumpPurpleColor;
+ (instancetype)crayolaPolishedPineColor;
+ (instancetype)crayolaPrincessPerfumeColor;
+ (instancetype)crayolaPurpleHeartColor;
+ (instancetype)crayolaPurpleMountainsMajestyColor;
+ (instancetype)crayolaPurplePizzazzColor;
+ (instancetype)crayolaPurplePlumColor;
+ (instancetype)crayolaQuickSilverColor;
+ (instancetype)crayolaRadicalRedColor;
+ (instancetype)crayolaRawSiennaColor;
+ (instancetype)crayolaRawUmberColor;
+ (instancetype)crayolaRazzleDazzleRoseColor;
+ (instancetype)crayolaRazzmatazzColor;
+ (instancetype)crayolaRazzmicBerryColor;
+ (instancetype)crayolaRedColor;
+ (instancetype)crayolaRedOrangeColor;
+ (instancetype)crayolaRedSalsaColor;
+ (instancetype)crayolaRedVioletColor;
+ (instancetype)crayolaRobinsEggBlueColor;
+ (instancetype)crayolaRoseColor;
+ (instancetype)crayolaRoseDustColor;
+ (instancetype)crayolaRosePearlColor;
+ (instancetype)crayolaRoseQuartzColor;
+ (instancetype)crayolaRoyalPurpleColor;
+ (instancetype)crayolaRubyColor;
+ (instancetype)crayolaRustyRedColor;
+ (instancetype)crayolaSalmonColor;
+ (instancetype)crayolaSalmonPearlColor;
+ (instancetype)crayolaSapphireColor;
+ (instancetype)crayolaSasquatchSocksColor;
+ (instancetype)crayolaScarletColor;
+ (instancetype)crayolaScreaminGreenColor;
+ (instancetype)crayolaSeaGreenColor;
+ (instancetype)crayolaSeaSerpentColor;
+ (instancetype)crayolaSepiaColor;
+ (instancetype)crayolaShadowColor;
+ (instancetype)crayolaShadowBlueColor;
+ (instancetype)crayolaShampooColor;
+ (instancetype)crayolaShamrockColor;
+ (instancetype)crayolaSheenGreenColor;
+ (instancetype)crayolaShimmeringBlushColor;
+ (instancetype)crayolaShinyShamrockColor;
+ (instancetype)crayolaShockingPinkColor;
+ (instancetype)crayolaSilverColor;
+ (instancetype)crayolaSizzlingRedColor;
+ (instancetype)crayolaSizzlingSunriseColor;
+ (instancetype)crayolaSkyBlueColor;
+ (instancetype)crayolaSlimyGreenColor;
+ (instancetype)crayolaSmashedPumpkinColor;
+ (instancetype)crayolaSmokeColor;
+ (instancetype)crayolaSmokeyTopazColor;
+ (instancetype)crayolaSoapColor;
+ (instancetype)crayolaSonicSilverColor;
+ (instancetype)crayolaSpringFrostColor;
+ (instancetype)crayolaSpringGreenColor;
+ (instancetype)crayolaSteelBlueColor;
+ (instancetype)crayolaSteelTealColor;
+ (instancetype)crayolaStrawberryColor;
+ (instancetype)crayolaSugarPlumColor;
+ (instancetype)crayolaSunburntCyclopsColor;
+ (instancetype)crayolaSunglowColor;
+ (instancetype)crayolaSunnyPearlColor;
+ (instancetype)crayolaSunsetOrangeColor;
+ (instancetype)crayolaSunsetPearlColor;
+ (instancetype)crayolaSweetBrownColor;
+ (instancetype)crayolaTanColor;
+ (instancetype)crayolaTartOrangeColor;
+ (instancetype)crayolaTealBlueColor;
+ (instancetype)crayolaThistleColor;
+ (instancetype)crayolaTickleMePinkColor;
+ (instancetype)crayolaTigersEyeColor;
+ (instancetype)crayolaTimberwolfColor;
+ (instancetype)crayolaTropicalRainForestColor;
+ (instancetype)crayolaTulipColor;
+ (instancetype)crayolaTumbleweedColor;
+ (instancetype)crayolaTurquoiseBlueColor;
+ (instancetype)crayolaTurquoisePearlColor;
+ (instancetype)crayolaTwilightLavenderColor;
+ (instancetype)crayolaUnmellowYellowColor;
+ (instancetype)crayolaVioletBlueColor;
+ (instancetype)crayolaVioletPurpleColor;
+ (instancetype)crayolaVioletRedColor;
+ (instancetype)crayolaVividTangerineColor;
+ (instancetype)crayolaVividVioletColor;
+ (instancetype)crayolaWhiteColor;
+ (instancetype)crayolaWildBlueYonderColor;
+ (instancetype)crayolaWildStrawberryColor;
+ (instancetype)crayolaWildWatermelonColor;
+ (instancetype)crayolaWinterSkyColor;
+ (instancetype)crayolaWinterWizardColor;
+ (instancetype)crayolaWintergreenDreamColor;
+ (instancetype)crayolaWisteriaColor;
+ (instancetype)crayolaYellowColor;
+ (instancetype)crayolaYellowGreenColor;
+ (instancetype)crayolaYellowOrangeColor;
+ (instancetype)crayolaYellowSunshineColor;
@end
