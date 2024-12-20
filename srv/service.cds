//Indicamos que utilizaremos el name space propio donde hemos creado las entidades
//y la ruta del fichero schema.cds donde se encuentran ubicadas estas entidades
using {com.jgm as entities} from '../db/schema';

//Para empezar a proyectar ponemos el nombre del servicio
service jgm_9194 {
    entity ProductsSet       as projection on entities.Products;
    entity ProductDetailsSet as projection on entities.Details;
    entity SuppliersSet      as projection on entities.Suppliers;
    entity ContactsSet       as projection on entities.Contacts;
    entity ReviewsSet        as projection on entities.Reviews;
    entity StockSet          as projection on entities.Stock;
    entity VH_Categories     as projection on entities.VH_Categories;
    entity VH_SubCategories  as projection on entities.VH_SubCategories;
}
