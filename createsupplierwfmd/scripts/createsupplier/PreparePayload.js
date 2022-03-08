
var oPayload;

// prepare roles data
var aRolesDataContext = $.context.BPRequest.RolesData;
var aRolesData = [];

for (var j = 0; j < aRolesDataContext.length; j++) {
    aRolesData.push({
        BusinessPartnerRole: aRolesDataContext[j].BusinessPartnerRole
    });
}

// prepare address data
var oAddressDataContext = $.context.BPRequest.AddressData;
var aAddressData = [];

aAddressData.push({
    Country: oAddressDataContext.Country,
    StreetName: oAddressDataContext.StreetName,
    HouseNumber: oAddressDataContext.HouseNumber,
    PostalCode: oAddressDataContext.PostalCode,
    CityName: oAddressDataContext.CityName,
});

// prepare bank data
var aBankDataContext = $.context.BPRequest.FinanceData.BankData;
var aBankData = [];

for (var j = 0; j < aBankDataContext.length; j++) {
    aBankData.push({
        BankName: aBankDataContext[j].BankName,
        SWIFTCode: aBankDataContext[j].SWIFTCode,
        BankNumber: aBankDataContext[j].BankNumber,
        BankAccountName: aBankDataContext[j].BankAccountName,
        BankAccount: aBankDataContext[j].BankAccount,
        CityName: aBankDataContext[j].CityName,
        BankCountryKey: aBankDataContext[j].BankCountryKey,
    });
}

// prepare tax data
var aTaxDataContext = $.context.BPRequest.FinanceData.TaxData;
var aTaxData = [];

for (var j = 0; j < aTaxDataContext.length; j++) {
    aTaxData.push({
        BPTaxType: aTaxDataContext[j].TaxCategory,
        BPTaxNumber: aTaxDataContext[j].TaxNumber
    });
}

oPayload = {
    BusinessPartnerCategory: $.context.BPRequest.BusinessPartnerCategory,
    GenderCodeName: $.context.BPRequest.BusinessPartnerCategory == "1" ? $.context.BPRequest.GenderCodeName : "",
    FirstName: $.context.BPRequest.BusinessPartnerCategory == "1" ? $.context.BPRequest.FirstName : "",
    LastName: $.context.BPRequest.BusinessPartnerCategory == "1" ? $.context.BPRequest.LastName : "",
    OrganizationBPName1: $.context.BPRequest.BusinessPartnerCategory == "2" ? $.context.BPRequest.BusinessPartnerName : "",
    AcademicTitle: "",
    AuthorizationGroup: "",
    BusinessPartnerGrouping: "",
    CorrespondenceLanguage: "",
    FormOfAddress: "",
    Industry: "",
    InternationalLocationNumber1: "",
    InternationalLocationNumber2: "",
    IsFemale: false,
    IsMale: false,
    IsNaturalPerson: "",
    IsSexUnknown: false,
    Language: "",
    LegalForm: "",
    OrganizationBPName2: "",
    OrganizationBPName3: "",
    OrganizationBPName4: "",
    OrganizationFoundationDate: null,
    OrganizationLiquidationDate: null,
    SearchTerm1: "",
    SearchTerm2: "",
    AdditionalLastName: "",
    BirthDate: null,
    BusinessPartnerBirthplaceName: "",
    BusinessPartnerIsBlocked: false,
    BusinessPartnerType: "",
    GroupBusinessPartnerName1: "",
    GroupBusinessPartnerName2: "",
    InternationalLocationNumber3: "",
    MiddleName: "",
    NameCountry: "",
    NameFormat: "",
    PersonFullName: "",
    IsMarkedForArchiving: false,
    BusinessPartnerIDByExtSystem: "",
    TradingPartner: "",
    to_BusinessPartnerRole: {
        results: aRolesData
    },
    to_BusinessPartnerAddress: {
        results: aAddressData
    },
    to_BusinessPartnerBank: {
        results: aBankData
    },
    to_BusinessPartnerTax: {
        results: aTaxData
    }
}

$.context.internal.BPCreationPayload = oPayload;

