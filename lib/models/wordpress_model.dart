class WPGuid {
  WPGuid({
    required this.rendered,
  });

  String rendered;

  factory WPGuid.fromJson(Map<String, dynamic> json) => WPGuid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class WPContent {
  WPContent({
    required this.rendered,
    this.protected,
  });

  String rendered;
  bool? protected;

  factory WPContent.fromJson(Map<String, dynamic> json) => WPContent(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class AcfFeatured {
  AcfFeatured({
    required this.featuredImage,
    this.generalOverview,
    this.qualificationsNeeded,
    this.suitability,
    this.payRange,
  });

  FeaturedImage featuredImage;
  String? generalOverview;
  String? qualificationsNeeded;
  String? suitability;
  String? payRange;

  factory AcfFeatured.fromJson(Map<String, dynamic> json) => AcfFeatured(
        featuredImage: FeaturedImage.fromJson(json["featured_image"]),
        generalOverview: json["general_overview"],
        qualificationsNeeded: json["qualifications_needed"],
        suitability: json["suitability"],
        payRange: json["pay_range"],
      );

  Map<String, dynamic> toJson() => {
        "featured_image": featuredImage.toJson(),
        "general_overview": featuredImage,
        "qualifications_needed": qualificationsNeeded,
        "suitability": suitability,
        "pay_range": payRange,
      };
}

class AcfFeaturedRole {
  AcfFeaturedRole({
    required this.featuredImage,
    this.generalOverview,
    this.qualificationsNeeded,
    this.suitability,
    this.payRange,
    required this.tips,
    required this.supportLinks,
    required this.similarRoles,
    required this.courseLinks,
  });

  FeaturedImage featuredImage;
  String? generalOverview;
  String? qualificationsNeeded;
  String? suitability;
  String? payRange;
  List<Tip> tips;
  List<Link> supportLinks;
  List<SimilarRole> similarRoles;
  List<Link> courseLinks;

  factory AcfFeaturedRole.fromJson(Map<String, dynamic> json) => AcfFeaturedRole(
        // Test
        featuredImage: FeaturedImage.fromJson(json["featured_image"]),
        generalOverview: json["general_overview"],
        qualificationsNeeded: json["qualifications_needed"],
        suitability: json["suitability"],
        payRange: json["pay_range"],
        tips: json["tips"] == false ? [] : List<Tip>.from(json["tips"].map((x) => Tip.fromJson(x))),
        supportLinks: json["support_links"] == false || json["support_links"] == null ? [] : List<Link>.from(json["support_links"].map((x) => Link.fromJson(x))),
        similarRoles: json["similiar_roles"] == false || json["similiar_roles"] == null ? [] : List<SimilarRole>.from(json["similiar_roles"].map((x) => SimilarRole.fromJson(x))),
        courseLinks: json["course_links"] == false || json["course_links"] == null ? [] : List<Link>.from(json["course_links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "featured_image": featuredImage.toJson(),
        "general_overview": featuredImage,
        "qualifications_needed": qualificationsNeeded,
        "suitability": suitability,
        "pay_range": payRange,
        // "support_links": supportLinks != null ? List<dynamic>.from(supportLinks!.map((x) => x.toJson())).toList() : null,
      };
}

class FeaturedImage {
  FeaturedImage({
    required this.id,
    required this.title,
    required this.url,
  });

  int id;
  String title;
  String url;

  factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        id: json["ID"],
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "title": title,
        "url": url,
      };
}

class AcfHeader {
  AcfHeader({
    required this.content,
  });

  String content;

  factory AcfHeader.fromJson(Map<String, dynamic> json) => AcfHeader(
        content: json["content"],
      );
  Map<String, dynamic> toJson() => {
        "content": content,
      };
}

class AcfOverview {
  AcfOverview({
    this.embedLink,
    this.overview,
  });

  String? embedLink;
  String? overview;

  factory AcfOverview.fromJson(Map<String, dynamic> json) => AcfOverview(
        embedLink: json["embed_link"],
        overview: json["overview"],
      );

  Map<String, dynamic> toJson() => {
        "embed_link": embedLink == null ? null : embedLink,
        "overview": overview == null ? null : overview,
      };
}

class LapsYoutube {
  LapsYoutube({
    this.youtubeImage,
  });

  String? youtubeImage;

  factory LapsYoutube.fromJson(Map<String, dynamic> json) => LapsYoutube(
        youtubeImage: json["youtube_image"],
      );

  Map<String, dynamic> toJson() => {
        "youtube_image": youtubeImage == null ? null : youtubeImage,
      };
}

class Sizes {
  Sizes({
    required this.thumbnail,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
    required this.medium,
    required this.mediumWidth,
    required this.mediumHeight,
    required this.mediumLarge,
    required this.mediumLargeWidth,
    required this.mediumLargeHeight,
    required this.large,
    required this.largeWidth,
    required this.largeHeight,
    required this.the1536X1536,
    required this.the1536X1536Width,
    required this.the1536X1536Height,
    required this.the2048X2048,
    required this.the2048X2048Width,
    required this.the2048X2048Height,
    required this.favicon,
    required this.faviconWidth,
    required this.faviconHeight,
    required this.featured,
    required this.featuredWidth,
    required this.featuredHeight,
    required this.featuredLarge,
    required this.featuredLargeWidth,
    required this.featuredLargeHeight,
    required this.event,
    required this.eventWidth,
    required this.eventHeight,
    required this.advice,
    required this.adviceWidth,
    required this.adviceHeight,
    required this.franchiseTall,
    required this.franchiseTallWidth,
    required this.franchiseTallHeight,
    required this.franchiseGallery,
    required this.franchiseGalleryWidth,
    required this.franchiseGalleryHeight,
    required this.woocommerceThumbnail,
    required this.woocommerceThumbnailWidth,
    required this.woocommerceThumbnailHeight,
    required this.woocommerceSingle,
    required this.woocommerceSingleWidth,
    required this.woocommerceSingleHeight,
    required this.woocommerceGalleryThumbnail,
    required this.woocommerceGalleryThumbnailWidth,
    required this.woocommerceGalleryThumbnailHeight,
    required this.shopCatalog,
    required this.shopCatalogWidth,
    required this.shopCatalogHeight,
    required this.shopSingle,
    required this.shopSingleWidth,
    required this.shopSingleHeight,
    required this.shopThumbnail,
    required this.shopThumbnailWidth,
    required this.shopThumbnailHeight,
  });

  String thumbnail;
  int thumbnailWidth;
  int thumbnailHeight;
  String medium;
  int mediumWidth;
  int mediumHeight;
  String mediumLarge;
  int mediumLargeWidth;
  int mediumLargeHeight;
  String large;
  int largeWidth;
  int largeHeight;
  String the1536X1536;
  int the1536X1536Width;
  int the1536X1536Height;
  String the2048X2048;
  int the2048X2048Width;
  int the2048X2048Height;
  String favicon;
  int faviconWidth;
  int faviconHeight;
  String featured;
  int featuredWidth;
  int featuredHeight;
  String featuredLarge;
  int featuredLargeWidth;
  int featuredLargeHeight;
  String event;
  int eventWidth;
  int eventHeight;
  String advice;
  int adviceWidth;
  int adviceHeight;
  String franchiseTall;
  int franchiseTallWidth;
  int franchiseTallHeight;
  String franchiseGallery;
  int franchiseGalleryWidth;
  int franchiseGalleryHeight;
  String woocommerceThumbnail;
  int woocommerceThumbnailWidth;
  int woocommerceThumbnailHeight;
  String woocommerceSingle;
  int woocommerceSingleWidth;
  int woocommerceSingleHeight;
  String woocommerceGalleryThumbnail;
  int woocommerceGalleryThumbnailWidth;
  int woocommerceGalleryThumbnailHeight;
  String shopCatalog;
  int shopCatalogWidth;
  int shopCatalogHeight;
  String shopSingle;
  int shopSingleWidth;
  int shopSingleHeight;
  String shopThumbnail;
  int shopThumbnailWidth;
  int shopThumbnailHeight;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        thumbnail: json["thumbnail"],
        thumbnailWidth: json["thumbnail-width"],
        thumbnailHeight: json["thumbnail-height"],
        medium: json["medium"],
        mediumWidth: json["medium-width"],
        mediumHeight: json["medium-height"],
        mediumLarge: json["medium_large"],
        mediumLargeWidth: json["medium_large-width"],
        mediumLargeHeight: json["medium_large-height"],
        large: json["large"],
        largeWidth: json["large-width"],
        largeHeight: json["large-height"],
        the1536X1536: json["1536x1536"],
        the1536X1536Width: json["1536x1536-width"],
        the1536X1536Height: json["1536x1536-height"],
        the2048X2048: json["2048x2048"],
        the2048X2048Width: json["2048x2048-width"],
        the2048X2048Height: json["2048x2048-height"],
        favicon: json["favicon"],
        faviconWidth: json["favicon-width"],
        faviconHeight: json["favicon-height"],
        featured: json["featured"],
        featuredWidth: json["featured-width"],
        featuredHeight: json["featured-height"],
        featuredLarge: json["featured-large"],
        featuredLargeWidth: json["featured-large-width"],
        featuredLargeHeight: json["featured-large-height"],
        event: json["event"],
        eventWidth: json["event-width"],
        eventHeight: json["event-height"],
        advice: json["advice"],
        adviceWidth: json["advice-width"],
        adviceHeight: json["advice-height"],
        franchiseTall: json["franchise-tall"],
        franchiseTallWidth: json["franchise-tall-width"],
        franchiseTallHeight: json["franchise-tall-height"],
        franchiseGallery: json["franchise-gallery"],
        franchiseGalleryWidth: json["franchise-gallery-width"],
        franchiseGalleryHeight: json["franchise-gallery-height"],
        woocommerceThumbnail: json["woocommerce_thumbnail"],
        woocommerceThumbnailWidth: json["woocommerce_thumbnail-width"],
        woocommerceThumbnailHeight: json["woocommerce_thumbnail-height"],
        woocommerceSingle: json["woocommerce_single"],
        woocommerceSingleWidth: json["woocommerce_single-width"],
        woocommerceSingleHeight: json["woocommerce_single-height"],
        woocommerceGalleryThumbnail: json["woocommerce_gallery_thumbnail"],
        woocommerceGalleryThumbnailWidth: json["woocommerce_gallery_thumbnail-width"],
        woocommerceGalleryThumbnailHeight: json["woocommerce_gallery_thumbnail-height"],
        shopCatalog: json["shop_catalog"],
        shopCatalogWidth: json["shop_catalog-width"],
        shopCatalogHeight: json["shop_catalog-height"],
        shopSingle: json["shop_single"],
        shopSingleWidth: json["shop_single-width"],
        shopSingleHeight: json["shop_single-height"],
        shopThumbnail: json["shop_thumbnail"],
        shopThumbnailWidth: json["shop_thumbnail-width"],
        shopThumbnailHeight: json["shop_thumbnail-height"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "thumbnail-width": thumbnailWidth,
        "thumbnail-height": thumbnailHeight,
        "medium": medium,
        "medium-width": mediumWidth,
        "medium-height": mediumHeight,
        "medium_large": mediumLarge,
        "medium_large-width": mediumLargeWidth,
        "medium_large-height": mediumLargeHeight,
        "large": large,
        "large-width": largeWidth,
        "large-height": largeHeight,
        "1536x1536": the1536X1536,
        "1536x1536-width": the1536X1536Width,
        "1536x1536-height": the1536X1536Height,
        "2048x2048": the2048X2048,
        "2048x2048-width": the2048X2048Width,
        "2048x2048-height": the2048X2048Height,
        "favicon": favicon,
        "favicon-width": faviconWidth,
        "favicon-height": faviconHeight,
        "featured": featured,
        "featured-width": featuredWidth,
        "featured-height": featuredHeight,
        "featured-large": featuredLarge,
        "featured-large-width": featuredLargeWidth,
        "featured-large-height": featuredLargeHeight,
        "event": event,
        "event-width": eventWidth,
        "event-height": eventHeight,
        "advice": advice,
        "advice-width": adviceWidth,
        "advice-height": adviceHeight,
        "franchise-tall": franchiseTall,
        "franchise-tall-width": franchiseTallWidth,
        "franchise-tall-height": franchiseTallHeight,
        "franchise-gallery": franchiseGallery,
        "franchise-gallery-width": franchiseGalleryWidth,
        "franchise-gallery-height": franchiseGalleryHeight,
        "woocommerce_thumbnail": woocommerceThumbnail,
        "woocommerce_thumbnail-width": woocommerceThumbnailWidth,
        "woocommerce_thumbnail-height": woocommerceThumbnailHeight,
        "woocommerce_single": woocommerceSingle,
        "woocommerce_single-width": woocommerceSingleWidth,
        "woocommerce_single-height": woocommerceSingleHeight,
        "woocommerce_gallery_thumbnail": woocommerceGalleryThumbnail,
        "woocommerce_gallery_thumbnail-width": woocommerceGalleryThumbnailWidth,
        "woocommerce_gallery_thumbnail-height": woocommerceGalleryThumbnailHeight,
        "shop_catalog": shopCatalog,
        "shop_catalog-width": shopCatalogWidth,
        "shop_catalog-height": shopCatalogHeight,
        "shop_single": shopSingle,
        "shop_single-width": shopSingleWidth,
        "shop_single-height": shopSingleHeight,
        "shop_thumbnail": shopThumbnail,
        "shop_thumbnail-width": shopThumbnailWidth,
        "shop_thumbnail-height": shopThumbnailHeight,
      };
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.wpAttachment,
    required this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<About> wpAttachment;
  List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class Link {
  Link({
    required this.link,
    required this.description,
  });

  String link;
  String description;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        link: json["link"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "description": description,
      };
}

class About {
  About({
    required this.href,
  });

  String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Cury {
  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  String name;
  String href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class AcfListImage {
  AcfListImage({
    required this.listImage,
    required this.featuredImage,
    this.address,
    this.eventDate,
    this.startTime,
    this.endTime,
  });

  FeaturedImage listImage;
  FeaturedImage featuredImage;
  String? address;
  String? eventDate;
  String? startTime;
  String? endTime;

  factory AcfListImage.fromJson(Map<String, dynamic> json) => AcfListImage(
        listImage: FeaturedImage.fromJson(json["list_image"]),
        featuredImage: FeaturedImage.fromJson(json["featured_image"]),
        address: json["address"] == null ? "" : json["address"],
        eventDate: json["event_date"] == null ? "" : json["event_date"],
        startTime: json["start_time"] == null ? "" : json["start_time"],
        endTime: json["end_time"] == null ? "" : json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "list_image": listImage.toJson(),
        "featured_image": featuredImage.toJson(),
        "address": address == null ? null : address,
        "event_date": eventDate == null ? null : eventDate,
        "start_time": startTime == null ? null : startTime,
        "end_time": endTime == null ? null : endTime,
      };
}

class WPIdName {
  WPIdName({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  String name;
  String slug;

  factory WPIdName.fromJson(Map<String, dynamic> json) => WPIdName(
        id: json["Id"],
        name: json["Name"],
        slug: json["Slug"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Slug": slug,
      };
}

class Tip {
  Tip({
    required this.tip,
  });

  String tip;

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
        tip: json["tip"],
      );

  Map<String, dynamic> toJson() => {
        "tip": tip,
      };
}

class SupportLinks {
  SupportLinks({
    required this.supportLinks,
  });

  List<SupportLink> supportLinks;

  factory SupportLinks.fromJson(Map<String, dynamic> json) => SupportLinks(
        supportLinks: List<SupportLink>.from(json["support_links"].map((x) => SupportLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "support_links": List<dynamic>.from(supportLinks.map((x) => x.toJson())),
      };
}

class SupportLink {
  SupportLink({
    required this.link,
    required this.description,
  });

  String link;
  String description;

  factory SupportLink.fromJson(Map<String, dynamic> json) => SupportLink(
        link: json["link"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "description": description,
      };
}

class SimilarRole {
  SimilarRole({
    required this.postTitle,
    required this.postName,
  });

  String postTitle;
  String postName;

  factory SimilarRole.fromJson(Map<String, dynamic> json) => SimilarRole(
        postTitle: json["post_title"],
        postName: json["post_name"],
      );

  Map<String, dynamic> toJson() => {
        "post_title": postTitle,
        "post_name": postName,
      };
}
