//nNamespace name. Contenedor para organizar nuestro código dependiendo de si queremos unas jerarquías
namespace com.jgm;

//Vamos a utilizar el aspecto cuid de la librería @sap/cds/common para el UUID de la claves de cada entidad
using {
        cuid,
        managed
} from '@sap/cds/common';

//Para aplicar ese UUID a las entidades tenemos que incluir entity Products : cuid {. Aunque no se vea, está definido.
entity Products : cuid, managed {
        product      : String(8);
        productName  : String;
        description  : LargeString;
        category     : Association to VH_Categories; // category_ID -->category/category
        subCategory  : Association to VH_SubCategories; //subCategory_ID -->subCategory/description Una campo se utiliza para navegar a otros campos de la Asociación
        availability : String;
        rating       : Decimal(3);
        price        : Decimal(3);
        currency     : String(3);
        details      : Association to Details;
        toReviews : Association to many Reviews on toReviews.product = $self;
        toStock : Association to many Stock on toStock.product = $self;
};

entity Details : cuid {
        baseUnit   : String(2);
        width      : Decimal(6, 3);
        height     : Decimal(6, 3);
        depth      : Decimal(6, 3);
        weight     : Decimal(6, 3);
        unitVolume : String(2);
        unitWeight : String(2);
};

entity Suppliers : cuid {
        key supplier     : String(9);
            supplierName : String(40);
            webAddress   : String;
};

entity Contacts : cuid {
        fullName    : String(40);
        email       : String;
        phoneNumber : String(14);
};

entity Reviews : cuid {
        rating       : Decimal(3, 2);
        creationDate : Date;
        user         : String(20);
        reviewText   : LargeString;
        product      : Association to Products;
};

entity Stock : cuid {
        stockNumber : Int16;
        department  : String;
        min         : Decimal(5, 2);
        max         : Decimal(5, 2);
        value       : Decimal(5, 2);
        lotSize     : Decimal(6, 3);
        quantity    : Decimal(6, 3);
        unit        : String(2);
        product     : Association to Products;
};

/**
 * Entidades de ayuda
 * VH = Value help
 */
entity VH_Categories : cuid {
        category        : String(20);
        description     : LargeString;
        toSubCategories : Association to many VH_SubCategories
                                  on toSubCategories.category = $self; // apunta los campos clave que tenga category
}

entity VH_SubCategories : cuid {
        subCategory : String(40);
        description : LargeString;
        category    : Association to VH_Categories; //Asociación 1:N de Categorias a subCategorias
}
