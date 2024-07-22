
import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    List<Item> items;

    DataModel({
        required this.items,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    String barcode;
    String location;
    String branch;
    String status;
    dynamic counter;
    String source;
    String category;
    String collection;
    String description;
    String metalGrp;
    String stkSection;
    String mfgdBy;
    String notes;
    DateTime inStkSince;
    String certNo;
    String huidNo;
    dynamic orderNo;
    String cusName;
    String size;
    String quality;
    dynamic kt;
    dynamic pcs;
    dynamic grossWt;
    dynamic netWt;
    dynamic diaPcs;
    dynamic diaWt;
    dynamic clsPcs;
    dynamic clsWt;
    dynamic chainWt;
    dynamic mRate;
    dynamic mValue;
    dynamic lRate;
    dynamic lCharges;
    dynamic rCharges;
    dynamic oCharges;
    dynamic mrp;
    String imageLink;
    List<TableDatum> tableData;

    Item({
        required this.barcode,
        required this.location,
        required this.branch,
        required this.status,
        required this.counter,
        required this.source,
        required this.category,
        required this.collection,
        required this.description,
        required this.metalGrp,
        required this.stkSection,
        required this.mfgdBy,
        required this.notes,
        required this.inStkSince,
        required this.certNo,
        required this.huidNo,
        required this.orderNo,
        required this.cusName,
        required this.size,
        required this.quality,
        required this.kt,
        required this.pcs,
        required this.grossWt,
        required this.netWt,
        required this.diaPcs,
        required this.diaWt,
        required this.clsPcs,
        required this.clsWt,
        required this.chainWt,
        required this.mRate,
        required this.mValue,
        required this.lRate,
        required this.lCharges,
        required this.rCharges,
        required this.oCharges,
        required this.mrp,
        required this.imageLink,
        required this.tableData,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        barcode: json["Barcode"],
        location: json["Location"],
        branch: json["Branch"],
        status: json["Status"],
        counter: json["Counter"],
        source: json["Source"],
        category: json["Category"],
        collection: json["Collection"],
        description: json["Description"],
        metalGrp: json["Metal_Grp"],
        stkSection: json["STK_Section"],
        mfgdBy: json["Mfgd_By"],
        notes: json["Notes"],
        inStkSince: DateTime.parse(json["In_STK_Since"]),
        certNo: json["Cert_No"],
        huidNo: json["HUID_No"],
        orderNo: json["Order_No"],
        cusName: json["Cus_Name"],
        size: json["Size"],
        quality: json["Quality"],
        kt: json["KT"],
        pcs: json["Pcs"],
        grossWt: json["Gross_Wt"],
        netWt: json["Net_Wt"],
        diaPcs: json["Dia_Pcs"],
        diaWt: json["Dia_Wt"],
        clsPcs: json["Cls_Pcs"],
        clsWt: json["Cls_Wt"],
        chainWt: json["Chain_Wt"],
        mRate: json["M_Rate"],
        mValue: json["M_Value"],
        lRate: json["L_Rate"],
        lCharges: json["L_Charges"],
        rCharges: json["R_Charges"],
        oCharges: json["O_Charges"],
        mrp: json["MRP"],
        imageLink: json["image_link"],
        tableData: List<TableDatum>.from(json["Table_Data"].map((x) => TableDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Barcode": barcode,
        "Location": location,
        "Branch": branch,
        "Status": status,
        "Counter": counter,
        "Source": source,
        "Category": category,
        "Collection": collection,
        "Description": description,
        "Metal_Grp": metalGrp,
        "STK_Section": stkSection,
        "Mfgd_By": mfgdBy,
        "Notes": notes,
        "In_STK_Since": "${inStkSince.year.toString().padLeft(4, '0')}-${inStkSince.month.toString().padLeft(2, '0')}-${inStkSince.day.toString().padLeft(2, '0')}",
        "Cert_No": certNo,
        "HUID_No": huidNo,
        "Order_No": orderNo,
        "Cus_Name": cusName,
        "Size": size,
        "Quality": quality,
        "KT": kt,
        "Pcs": pcs,
        "Gross_Wt": grossWt,
        "Net_Wt": netWt,
        "Dia_Pcs": diaPcs,
        "Dia_Wt": diaWt,
        "Cls_Pcs": clsPcs,
        "Cls_Wt": clsWt,
        "Chain_Wt": chainWt,
        "M_Rate": mRate,
        "M_Value": mValue,
        "L_Rate": lRate,
        "L_Charges": lCharges,
        "R_Charges": rCharges,
        "O_Charges": oCharges,
        "MRP": mrp,
        "image_link": imageLink,
        "Table_Data": List<dynamic>.from(tableData.map((x) => x.toJson())),
    };
}

class TableDatum {
    String lotDescription;
    String group;
    String units;
    dynamic pcs;
    dynamic weight;
    dynamic rate;
    dynamic value;
    dynamic sRate;
    dynamic sValue;

    TableDatum({
        required this.lotDescription,
        required this.group,
        required this.units,
        required this.pcs,
        required this.weight,
        required this.rate,
        required this.value,
        required this.sRate,
        required this.sValue,
    });

    factory TableDatum.fromJson(Map<String, dynamic> json) => TableDatum(
        lotDescription: json["Lot_Description"],
        group: json["Group"],
        units: json["Units"],
        pcs: json["Pcs"],
        weight: json["Weight"],
        rate: json["Rate"],
        value: json["Value"],
        sRate: json["S_Rate"],
        sValue: json["S_Value"],
    );

    Map<String, dynamic> toJson() => {
        "Lot_Description": lotDescription,
        "Group": group,
        "Units": units,
        "Pcs": pcs,
        "Weight": weight,
        "Rate": rate,
        "Value": value,
        "S_Rate": sRate,
        "S_Value": sValue,
    };
}
