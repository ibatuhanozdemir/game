import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class Citizen {

  List femaleNames = ["Emily","Hannah","Madison","Ashley","Sarah","Alexis","Samantha","Jessica","Elizabeth","Taylor","Lauren","Alyssa","Kayla","Abigail","Brianna","Olivia","Emma","Megan","Grace","Victoria","Rachel","Anna","Sydney","Destiny","Morgan","Jennifer","Jasmine","Haley","Julia","Kaitlyn","Nicole","Amanda","Katherine","Natalie","Hailey","Alexandra","Savannah","Chloe","Rebecca","Stephanie","Maria","Sophia","Mackenzie","Allison","Isabella","Amber","Mary","Danielle","Gabrielle","Jordan","Brooke","Michelle","Sierra","Katelyn","Andrea","Madeline","Sara","Kimberly","Courtney","Erin","Brittany","Vanessa","Jenna","Jacqueline","Caroline","Faith","Makayla","Bailey","Paige","Shelby","Melissa","Kaylee","Christina","Trinity","Mariah","Caitlin","Autumn","Marissa","Breanna","Angela","Catherine","Zoe","Briana","Jada","Laura","Claire","Alexa","Kelsey","Kathryn","Leslie","Alexandria","Sabrina","Mia","Isabel","Molly","Leah","Katie","Gabriella","Cheyenne","Cassandra","Tiffany","Erica","Lindsey","Kylie","Amy","Diana","Cassidy","Mikayla","Ariana","Margaret","Kelly","Miranda","Maya","Melanie","Audrey","Jade","Gabriela","Caitlyn","Angel","Jillian","Alicia","Jocelyn","Erika","Lily","Heather","Madelyn","Adriana","Arianna","Lillian","Kiara","Riley","Crystal","Mckenzie","Meghan","Skylar","Ana","Britney","Angelica","Kennedy","Chelsea","Daisy","Kristen","Veronica","Isabelle","Summer","Hope","Brittney","Lydia","Hayley","Evelyn","Bethany","Shannon","Michaela","Karen","Jamie","Daniela","Angelina","Kaitlin","Karina","Sophie","Sofia","Diamond","Payton","Cynthia","Alexia","Valerie","Monica","Peyton","Carly","Bianca","Hanna","Brenda","Rebekah","Alejandra","Mya","Avery","Brooklyn","Ashlyn","Lindsay","Ava","Desiree","Alondra","Camryn","Ariel","Naomi","Jordyn","Kendra","Mckenna","Holly","Julie","Kendall","Kara","Jasmin","Selena","Esmeralda","Amaya","Kylee","Maggie","Makenzie","Claudia","Kyra","Cameron","Karla","Kathleen","Abby","Delaney","Amelia","Casey","Serena","Savanna","Aaliyah","Giselle","Mallory","April","Raven","Adrianna","Christine","Kristina","Nina","Asia","Natalia","Valeria","Aubrey","Lauryn","Kate","Patricia","Jazmin","Rachael","Katelynn","Cierra","Alison","Macy","Nancy","Elena","Kyla","Katrina","Jazmine","Joanna","Tara","Gianna","Juliana","Fatima","Allyson","Gracie","Sadie","Guadalupe","Genesis","Yesenia","Julianna","Skyler","Tatiana","Alexus","Alana","Elise","Kirsten","Nadia","Sandra","Dominique","Ruby","Haylee","Jayla","Tori","Cindy","Sidney","Ella","Tessa","Carolina","Camille","Jaqueline","Whitney","Carmen","Vivian","Priscilla","Bridget","Celeste","Kiana","Makenna","Alissa","Madeleine","Miriam","Natasha","Ciara","Cecilia","Mercedes","Kassandra","Reagan","Aliyah","Josephine","Charlotte","Rylee","Shania","Kira","Meredith","Eva","Lisa","Dakota","Hallie","Anne","Rose","Liliana","Kristin","Deanna","Imani","Marisa","Kailey","Annie","Nia","Carolyn","Anastasia","Brenna","Dana","Shayla","Ashlee","Kassidy","Alaina","Rosa","Wendy","Logan","Tabitha","Paola","Callie","Addison","Lucy","Gillian","Clarissa","Destinee","Josie","Esther","Denise","Katlyn","Mariana","Bryanna","Emilee","Georgia","Deja","Kamryn","Ashleigh","Cristina","Baylee","Heaven","Ruth","Raquel","Monique","Teresa","Helen","Krystal","Tiana","Cassie","Kayleigh","Marina","Heidi","Ivy","Ashton","Clara","Meagan","Gina","Linda","Gloria","Jacquelyn","Ellie","Jenny","Renee","Daniella","Lizbeth","Anahi","Virginia","Gisselle","Kaitlynn","Julissa","Cheyanne","Lacey","Haleigh","Marie","Martha","Eleanor","Kierra","Tiara","Talia","Eliza","Kaylie","Mikaela","Harley","Jaden","Hailee","Madalyn","Kasey","Ashlynn","Brandi","Lesly","Elisabeth","Allie","Viviana","Cara","Marisol","India","Tatyana","Litzy","Melody","Jessie","Brandy","Alisha","Hunter","Noelle","Carla","Francesca","Tia","Layla","Krista","Zoey","Carley","Janet","Carissa","Iris","Kaleigh","Tyler","Susan","Tamara","Theresa","Yasmine","Tatum","Sharon","Alice","Yasmin","Tamia","Abbey","Alayna","Kali","Lilly","Bailee","Lesley","Mckayla","Ayanna","Serenity","Karissa","Precious","Jane","Maddison","Jayda","Kelsie","Lexi","Phoebe","Halle","Kiersten","Kiera","Tyra","Annika","Felicity","Taryn","Kaylin","Ellen","Kiley","Jaclyn","Rhiannon","Madisyn","Colleen","Joy","Pamela","Charity","Tania","Fiona","Alyson","Kaila","Annabelle","Emely","Angelique","Alina","Irene","Johanna","Regan","Janelle","Janae","Madyson","Paris","Justine","Chelsey","Sasha","Paulina","Mayra","Zaria","Skye","Cora","Brisa","Emilie","Felicia","Larissa","Macie","Tianna","Aurora","Sage","Lucia","Alma","Chasity","Ann","Deborah","Nichole","Jayden","Alanna","Malia","Carlie","Angie","Nora","Kailee","Sylvia","Carrie","Elaina","Sonia","Genevieve","Kenya","Piper","Marilyn","Amari","Macey","Marlene","Barbara","Tayler","Julianne","Brooklynn","Lorena","Perla","Elisa","Kaley","Leilani","Eden","Miracle","Devin","Aileen","Chyna","Athena","Esperanza","Regina","Adrienne","Shyanne","Luz","Tierra","Cristal","Clare","Eliana","Kelli","Eve","Sydnee","Madelynn","Breana","Melina","Arielle","Justice","Toni","Corinne","Maia","Tess","Abbigail","Ciera","Ebony","Maritza","Lena","Lexie","Isis","Aimee","Leticia","Sydni","Sarai","Halie","Alivia","Destiney","Laurel","Edith","Carina","Fernanda","Amya","Destini","Aspen","Nathalie","Paula","Tanya","Frances","Tina","Christian","Elaine","Shayna","Aniya","Mollie","Ryan","Essence","Simone","Kyleigh","Nikki","Anya","Reyna","Kaylyn","Nicolette","Savanah","Abbie"];
  static List citizen = [
    {
      'id': 1,
      'name': 'tayfun vural',
      'workarea': 'woodcutter',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes',
      'hunger' : 'yes'
    },
    {
      'id': 2,
      'name': 'batuhan özdemir',
      'workarea': 'woodcutter',
      'gender': 'female',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes',
      'hunger' : 'yes'
    },
    {
      'id': 3,
      'name': 'batuhan özdemir2',
      'workarea': 'stonecutter',
      'gender': 'male',
      'health': 90,
      'happiness': 80,
      'overallef': 70,
      'age': 40,
      'tool': 'copper axe',
      'cloth': 'jean',
      'education': 'yes',
      'hunger' : 'yes'
    },
    {
      'id': 4,
      'name': 'batuhan özdemir2',
      'workarea': 'stonecutter',
      'gender': 'male',
      'health': 75,
      'happiness': 60,
      'overallef': 80,
      'age': 20,
      'tool': 'wooden axe',
      'cloth': 'nothing',
      'education': 'yes',
      'hunger' : 'yes'
    },
    {
      'id': 5,
      'name': 'batuhan özdemir2',
      'workarea': 'stonecutter',
      'gender': 'male',
      'health': 60,
      'happiness': 80,
      'overallef': 40,
      'age': 50,
      'tool': 'iron axe',
      'cloth': 'leather',
      'education': 'yes',
      'hunger' : 'yes'
    }
  ];

  static int citizenCapacity = 100;
  int min = 0;

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('citizen', jsonEncode(citizen));
  }

  Future<int> loadCitizen() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getString('citizen');

    if (startupNumber == null) {
      citizen = citizen;

      return 0;
    }
    citizen = jsonDecode(startupNumber);

    return 0;
  }

  void incrementAge() {
    citizen.forEach((element) {
      element['age'] = element['age'] + 1;
    });
  }

  void citizenBirth(){

    if(citizen.length <citizenCapacity){
      if(next(0, 101)>80){

      int gender = next(0, 2);
      print(gender);
      Map newCitizen = {
        'id': citizen[citizen.length-1]["id"]+1,
        'name': femaleNames[next(min, femaleNames.length-1)] + " " + femaleNames[next(min, femaleNames.length-1)],
        'workarea': 'unemployed',
        'gender':  gender == 1 ? 'male' : 'female',
        'health': 100,
        'happiness': 100,
        'overallef': 100,
        'age': 0,
        'tool': 'nothing',
        'cloth': 'nothing',
        'education': 'no',
        'hunger' : 'yes'
      };
      citizen.add(newCitizen);
      newCitizen = {};}

    }
  }

  final _random = new Random();
  int next(min, int max) => min + _random.nextInt(max - min);



}
