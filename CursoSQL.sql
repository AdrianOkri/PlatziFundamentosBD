DROP TABLE IF EXISTS Carrito;
DROP TABLE IF EXISTS Carrito_Item;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Item_Proveedor;
DROP TABLE IF EXISTS Mcompra;
DROP TABLE IF EXISTS Mpago;
DROP TABLE IF EXISTS Proveedor;

/*====================================================*/
/*                  Table: Carrito                    */
/*====================================================*/
CREATE TABLE Carrito (
    carrito_id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    cliente_cuentaPlatzii VARCHAR(60) NOT NULL,
    mpago_id INT NOT NULL,
    mcompra_id INT NOT NULL,
    mcompra_cod NUMERIC(15,0) NOT NULL,
    carrito_numItem NUMERIC(3,0) NOT NULL,
    carrito_dir VARCHAR(120),
    carrito_coment VARCHAR(300),
    carrito_tag VARCHAR(100),
    PRIMARY KEY (carrito_id)
);
/*====================================================*/
/*                  Table: Carrito_Item               */
/*====================================================*/
CREATE TABLE Carrito_Item (
    item_id INT NOT NULL,
    carrito_id INT NOT NULL,
    PRIMARY KEY (item_id, carrito_id)
);
/*====================================================*/
/*                  Table: Cliente                    */
/*====================================================*/
CREATE TABLE Cliente (
    cliente_id INT(10) NOT NULL AUTO_INCREMENT,
    cliente_cuentaPlatzi VARCHAR(60) NOT NULL,
    cliente_nombre VARCHAR(80) NOT NULL,
    cliente_fechaIni TIMESTAMP NOT NULL,
    cliente_correo VARCHAR(60),
    cliente_fechaNac TIMESTAMP,
    cliente_preferencias VARCHAR(300),
    PRIMARY KEY (cliente_id, cliente_cuentaPlatzi)
);
/*====================================================*/
/*                  Table: Item                       */
/*====================================================*/
CREATE TABLE Item (
    item_id INT NOT NULL AUTO_INCREMENT,
    item_nombre VARCHAR(60) NOT NULL,
    item_desc VARCHAR(300) NOT NULL,
    item_medidas VARCHAR(60) NOT NULL,
    item_peso VARCHAR(15) NOT NULL,
    item_fot LONGBLOB,
    PRIMARY KEY (item_id)
);
/*====================================================*/
/*                  Table: Item_Proveedor             */
/*====================================================*/
CREATE TABLE Item_Proveedor (
    prov_id NUMERIC(5,0) NOT NULL,
    prov_codCc VARCHAR(15) NOT NULL COMMENT 'Codigo Camara de Comercio',
    item_id INT NOT NULL,
    lote VARCHAR(10) NOT NULL,
    PRIMARY KEY (prov_id, prov_codCc, item_id)
);
/*====================================================*/
/*                  Table: Mcompra                    */
/*====================================================*/
CREATE TABLE Mcompra (
    mcompra_id INT NOT NULL AUTO_INCREMENT,
    mcompra_cod NUMERIC(15,0) NOT NULL,
    mcompra_metodo VARCHAR(250) NOT NULL,
    mcompra_fechaIni TIMESTAMP NOT NULL,
    mcompra_dir VARCHAR(120),
    PRIMARY KEY (mcompra_id, mcompra_cod)
);