// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class WasteClassification {
  final int id;
  final String category;
  final String description;
  final String disposalMethod;
  final String environmentalImpact;
  final String tipsForUsers;

  WasteClassification({
    required this.id,
    required this.category,
    required this.description,
    required this.disposalMethod,
    required this.environmentalImpact,
    required this.tipsForUsers,
  });
}

class MaterialClassificationContainer extends StatelessWidget {
  final String material;

  const MaterialClassificationContainer(this.material,
      {super.key,});

  WasteClassification classifyMaterial(String material) {
    print(material);
   // print(imagePath);

    List<String> organic = [
      "carrot",
      "onion",
      "fruits",
      "food",
      "fast food",
      "flowers",
      "leaf",
      "tree",
      "Food"
    ];
    List<String> inorganic = [
      "plastic",  
      "ceramics",
      "concrete",
      "stone",
      "rubber",
      "tableware"
    ];

    List<String> hazardous = [
      "chemicals",
      "toxic waste",
      "radioactive materials",
      "biological agents",
      "explosives",
      "flammable substances",
      "asbestos",
      "mercury",
      "lead",
      "pesticides",
      "corrosive materials",
      "gasoline",
      "nuclear waste",
      "asphyxiants",
      "pathogenic materials",
      "infectious substances",
      "oxidizing agents",
      "cyanide",
      "arsenic"
    ];

    // E-waste
    List<String> eWaste = [
      "computers",
      "laptops",
      "mobile phone",
      "televisions",
      "printers",
      "circuit boards",
      "batteries",
      "power cords",
      "electronic components"
    ];

// Paper
    List<String> paper = [
      "newspapers",
      "magazines",
      "paper",
      "cardboard",
      "office paper",
      "wrapping paper",
      "paper bags",
      "books",
      "junk mail",
      "envelopes"
    ];

// Glass
    List<String> glass = [
      "glass bottles",
      "glass jars",
      "windows",
      "drinking glasses",
      "mirrors",
      "glass containers"
    ];

// Metal
    List<String> metal = [
      "aluminum cans",
      "steel cans",
      "copper wires",
      "aluminum foil",
      "metal pipes",
      "metal appliances",
      "tin cans",
      "scrap metal",
      "metal"
    ];

    if (organic.contains(material.toLowerCase())) {
      return WasteClassification(
        category: "Organic Waste",
        description:
            "Organic waste primarily consists of biodegradable materials derived from living organisms. These materials can decompose naturally and are an essential component of composting.\n Proper disposal of organic waste not only reduces landfill burden but also contributes to the creation of nutrient-rich compost for soil enrichment.",
        disposalMethod:
            "Proper Disposal:\n\nBackyard Composting: Encourage residents to compost organic kitchen and garden waste in their backyard compost bins.\n*Provide tips on maintaining a healthy compost pile, such as turning the compost regularly.\n*Municipal Composting Programs: Inform users about local municipal composting programs where organic waste is collected separately for industrial-scale composting.\n*Avoid Contamination: Remind users to avoid contaminating organic waste with non-biodegradable items such as plastic, glass, or metal.",
        environmentalImpact:
            "Environmental Impact:\n\nOrganic waste, when disposed of properly, plays a crucial role in reducing methane emissions in landfills and enriching the soil with valuable nutrients. Composting organic waste creates a sustainable cycle that benefits both the environment and local agriculture.",
        tipsForUsers:
            "Tips for Users:\n\n*Keep a small compost bin in your kitchen for easy collection of organic kitchen waste.\n*Cut larger garden waste into smaller pieces for faster decomposition.\n*Learn about the composting process and the balance of green (nitrogen-rich) and brown (carbon-rich) materials.",
        id: 1,
      );
    }
    if (inorganic.contains(material.toLowerCase())) {
  return WasteClassification(
    category: "Inorganic Waste",
    description:
        "Inorganic waste consists of non-biodegradable materials that do not originate from living organisms. These materials typically do not decompose naturally and may pose challenges in waste management.\n Proper disposal of inorganic waste is essential to reduce environmental impact and promote recycling initiatives.",
    disposalMethod:
        "\nRecycling Programs: Encourage users to participate in local recycling programs where inorganic materials such as plastics, glass, and metals can be collected and processed for reuse.\n*Separation at Source: Remind users to separate recyclable inorganic items from general waste at the point of disposal.\n*Landfill Disposal: In cases where recycling is not possible, inform users about proper landfill disposal methods for non-recyclable inorganic waste.",
    environmentalImpact:
        "\nEffective management of inorganic waste through recycling helps conserve natural resources, reduce energy consumption, and minimize the environmental footprint associated with the production of new materials. Recycling plays a key role in sustainable waste practices.",
    tipsForUsers:
        "\n*Familiarize yourself with local recycling guidelines and categories.\n*Rinse and clean recyclable items before disposal to improve the efficiency of the recycling process.\n*Reduce single-use plastic consumption by opting for reusable alternatives.",
    id: 2,
  );
}

    if (hazardous.contains(material.toLowerCase())) {
      return WasteClassification(
          category: "Hazardous Waste",
          description:
              "Hazardous waste consists of materials that pose a threat to human health, the environment, or both. These materials include chemicals, toxic waste, radioactive materials, biological agents, explosives, flammable substances, asbestos, mercury, lead, pesticides, corrosive materials, gasoline, nuclear waste, asphyxiants, pathogenic materials, infectious substances, oxidizing agents, cyanide, and arsenic.",
          disposalMethod:
              "\nSpecialized Facilities: Advise users to dispose of hazardous waste at specialized disposal facilities designed to handle these materials safely.\n*Contact Authorities: Remind users to contact local authorities for guidance on proper disposal methods for specific hazardous items.\n*Do Not Mix: Warn against mixing hazardous waste with regular waste to prevent contamination.",
          environmentalImpact:
              "\nImproper disposal of hazardous waste can lead to soil and water contamination, posing serious risks to ecosystems and human health. Proper disposal methods are essential to minimize these risks.",
          tipsForUsers:
              "\n*Educate yourself about the hazardous waste disposal regulations in your area.\n*Use less harmful alternatives to reduce the generation of hazardous waste.\n*Follow safety guidelines when handling and disposing of hazardous materials.",
          id: 1);
    }
    if (eWaste.contains(material.toLowerCase())) {
      return WasteClassification(
          category: "E-Waste",
          description:
              "E-waste, or electronic waste, encompasses discarded electronic devices and appliances. This category includes computers, laptops, mobile phones, televisions, printers, circuit boards, batteries, power cords, and other electronic components. Due to the presence of hazardous materials, proper disposal and recycling of e-waste are essential for environmental protection.",
          disposalMethod:
              "\nE-Waste Collection Centers: Advise users to utilize designated e-waste collection centers for proper disposal.\n*Manufacturer Take-Back Programs: Inform users about programs offered by manufacturers for the return and recycling of electronic devices.\n*Local Recycling Events: Promote participation in local e-waste recycling events organized by communities or municipalities.",
          environmentalImpact:
              "\nRecycling e-waste prevents the release of harmful substances into the environment, such as lead, mercury, and other toxic materials. It also helps recover valuable metals and reduces the environmental impact of electronic waste.",
          tipsForUsers:
              "\n*Delete personal data from electronic devices before disposal or recycling.\n*Consider donating or selling functional electronic devices to extend their lifespan.\n*Stay informed about local e-waste recycling options and events.",
          id: 1);
    }
    if (paper.contains(material.toLowerCase())) {
      return WasteClassification(
          category: "Paper Waste",
          description:
              "Paper waste consists of various paper-based materials that are no longer in use. This category includes newspapers, magazines, cardboard, office paper, wrapping paper, paper bags, books, junk mail, and envelopes. Proper disposal of paper waste is essential for recycling and reducing environmental impact.",
          disposalMethod:
              "\nRecycling Bins: Encourage users to dispose of paper waste in designated recycling bins for paper products.\n*Separate Materials: Advise users to separate paper waste from other recyclables to maintain recycling efficiency.\n*Municipal Recycling Programs: Inform users about local municipal recycling programs where paper waste is collected for processing.",
          environmentalImpact:
              "\nRecycling paper waste helps conserve natural resources, reduce energy consumption, and minimize the environmental impact of paper production. By recycling paper, users contribute to the sustainable management of forests and the reduction of landfill waste.",
          tipsForUsers:
              "\n*Set up a designated bin for paper recycling at home or in the office.\n*Remove any non-paper items, such as plastic or metal, from paper waste before recycling.\n*Support and participate in community-wide paper recycling initiatives for a collective impact.",
          id: 1);
    }
    if (glass.contains(material.toLowerCase())) {
      return WasteClassification(
          category: "Glass Waste",
          description:
              "Glass waste comprises items made of glass, such as glass bottles, glass jars, windows, drinking glasses, mirrors, and glass containers. Glass is infinitely recyclable without losing quality, making proper disposal and recycling crucial to reduce energy consumption and environmental impact.",
          disposalMethod:
              "\nGlass Recycling Bins: Encourage users to dispose of glass waste in designated glass recycling bins.\n*Separate Colors: Advise users to separate clear, colored, and tinted glass for more efficient recycling.\n*Avoid Contamination: Remind users to avoid contaminating glass waste with non-glass materials.",
          environmentalImpact:
              "\nRecycling glass reduces the need for raw materials, conserves energy, and decreases greenhouse gas emissions. Proper glass disposal contributes to sustainability and environmental conservation.",
          tipsForUsers:
              "\n*Re-use glass containers for storage to extend their lifespan.\n*Support local businesses that use recycled glass in their products.\n*Dispose of broken glass carefully to prevent injuries to waste handlers.",
          id: 1);
    }
    if (metal.contains(material.toLowerCase())) {
      return WasteClassification(
          category: "Metal Waste",
          description:
              "Metal waste includes various metallic items such as aluminum cans, steel cans, copper wires, aluminum foil, metal pipes, metal appliances, tin cans, and scrap metal. Metals are highly recyclable and can be transformed into new products with minimal energy consumption.",
          disposalMethod:
              "\nMetal Recycling Facilities: Encourage users to utilize designated metal recycling facilities based on metal types.\n*Scrap Yards: Advise users to take large metal items or bulk metal waste to scrap yards for recycling.\n*Remove Non-Metal Parts: Remind users to remove non-metal parts before recycling metal items.",
          environmentalImpact:
              "\nRecycling metal waste reduces the need for mining raw materials, conserves energy, and minimizes air and water pollution. Proper metal disposal supports a circular economy and sustainable resource management.",
          tipsForUsers:
              "\n*Collect and save small metal items for recycling rather than discarding them.\n*Consider upcycling metal items into artistic or functional pieces.\n*Educate others about the benefits of metal recycling to promote sustainable practices.",
          id: 1);
    }

    return WasteClassification(
      category: "Not Classified",
      description: "Not Classified",
      disposalMethod: "Not Classified",
      environmentalImpact: "Not Classified",
      tipsForUsers: "Not Classified",
      id: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    WasteClassification classification = classifyMaterial(material);

    if (classification.id == 1) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category: ${classification.category}",
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text("Description: ${classification.description}"),
            const SizedBox(height: 8.0),
            Text("Disposal Method: ${classification.disposalMethod}"),
            const SizedBox(height: 8.0),
            Text(
                "Environmental Impact: ${classification.environmentalImpact}"),
            const SizedBox(height: 8.0),
            Text("Tips for Users: ${classification.tipsForUsers}"),
          ],
        ),
      );
    // } else if (classification.id == 0) {
    //   // Return ImagePickerDemo widget with imagePath
    //   return ImagePickerDemo(imagePath: imagePath);
    } else {
      // No image detected
      return const Text('No image is detected');
    }
  }
}