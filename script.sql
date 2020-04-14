CREATE TABLE h_asistente (
    asistente_id   NUMBER NOT NULL,
    contenido      VARCHAR2(4000) NOT NULL,
    vigencia_flag  NUMBER DEFAULT 1 NOT NULL,
    modulo_id      NUMBER NOT NULL,
    vigencia       NUMBER DEFAULT 1 NOT NULL
);

COMMENT ON COLUMN h_asistente.asistente_id IS
    'Identificador único del contenido del asistente para cada módulo.';

COMMENT ON COLUMN h_asistente.contenido IS
    'Contenido a desplegar por el asistente.';

COMMENT ON COLUMN h_asistente.vigencia_flag IS
    'Flag para establecer si el contenido está vigente para ser usado o no.';

COMMENT ON COLUMN h_asistente.vigencia IS
    'Flag para esteblecer vigencia del registro de ayuda..';

ALTER TABLE h_asistente ADD CONSTRAINT asistente_pk PRIMARY KEY ( asistente_id );

CREATE TABLE h_comuna (
    comuna_id  NUMBER NOT NULL,
    nombre     VARCHAR2(100) NOT NULL,
    region_id  NUMBER NOT NULL
);

COMMENT ON COLUMN h_comuna.comuna_id IS
    'Identificador único de la comuna.';

COMMENT ON COLUMN h_comuna.nombre IS
    'Nombre de la comuna.';

ALTER TABLE h_comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( comuna_id );

CREATE TABLE h_habitacion (
    habitacion_id         NUMBER NOT NULL,
    rotulo                VARCHAR2(20),
    habitacion_tipo_id    NUMBER NOT NULL,
    habitacion_estado_id  NUMBER NOT NULL,
    camas                 VARCHAR2(4000),
    accesorios            VARCHAR2(4000),
    precio                NUMBER NOT NULL
);

COMMENT ON COLUMN h_habitacion.habitacion_id IS
    'Identificador único de la habitación.';

COMMENT ON COLUMN h_habitacion.camas IS
    'Descripción de las camas que la habitación cuenta.';

COMMENT ON COLUMN h_habitacion.accesorios IS
    'Accesorios que tiene la habitación.';

COMMENT ON COLUMN h_habitacion.precio IS
    'Tariga de la habitación.';

ALTER TABLE h_habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( habitacion_id );

CREATE TABLE h_habitacion_estado (
    habitacion_estado_id  NUMBER NOT NULL,
    descripcion           VARCHAR2(100) NOT NULL,
    usable                NUMBER DEFAULT 1 NOT NULL
);

COMMENT ON COLUMN h_habitacion_estado.habitacion_estado_id IS
    'Identificador único del estado de la habitación.';

COMMENT ON COLUMN h_habitacion_estado.descripcion IS
    'Estado de la habitación.';

COMMENT ON COLUMN h_habitacion_estado.usable IS
    'Flag para establecer si el estado asignado permite que la habitación sea usada.';

ALTER TABLE h_habitacion_estado ADD CONSTRAINT habitacion_estado_pk PRIMARY KEY ( habitacion_estado_id );

CREATE TABLE h_habitacion_tipo (
    habitacion_tipo_id  NUMBER NOT NULL,
    descriptor          VARCHAR2(100)
);

COMMENT ON COLUMN h_habitacion_tipo.habitacion_tipo_id IS
    'Identificación del tipo de habitación.';

COMMENT ON COLUMN h_habitacion_tipo.descriptor IS
    'Descriptor del tipo de habitación.';

ALTER TABLE h_habitacion_tipo ADD CONSTRAINT habitacion_tipo_pk PRIMARY KEY ( habitacion_tipo_id );

CREATE TABLE h_huesped_habitacion (
    huesped_habitacion_id  NUMBER NOT NULL,
    huesped_id             NUMBER NOT NULL,
    habitacion_id          NUMBER NOT NULL
);

ALTER TABLE h_huesped_habitacion
    ADD CONSTRAINT huesped_habitacion_pk PRIMARY KEY ( huesped_habitacion_id,
                                                       huesped_id,
                                                       habitacion_id );

CREATE TABLE h_menu (
    menu_id         NUMBER NOT NULL,
    nombre          VARCHAR2(100) NOT NULL,
    registro_fecha  DATE DEFAULT sysdate NOT NULL,
    plato_id        NUMBER NOT NULL,
    vigencia        NUMBER DEFAULT 1 NOT NULL
);

COMMENT ON COLUMN h_menu.menu_id IS
    'Identificador unico del menu.';

COMMENT ON COLUMN h_menu.nombre IS
    'Nombre del menu.';

COMMENT ON COLUMN h_menu.registro_fecha IS
    'Fecha de registro del menu.';

COMMENT ON COLUMN h_menu.vigencia IS
    'Flag para esteblecer vigencia del menú.';

ALTER TABLE h_menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menu_id );

CREATE TABLE h_minuta (
    minuta_id  NUMBER NOT NULL,
    menu_id    NUMBER NOT NULL,
    fecha      NUMBER NOT NULL,
    vigencia   NUMBER(1) DEFAULT 1 NOT NULL
);

COMMENT ON COLUMN h_minuta.minuta_id IS
    'Identificador unico de la minuta.';

COMMENT ON COLUMN h_minuta.fecha IS
    'Fecha de agendamiento de la minuta.';

COMMENT ON COLUMN h_minuta.vigencia IS
    'Flag para esteblecer vigencia de la minuta..';

ALTER TABLE h_minuta ADD CONSTRAINT minuta_pk PRIMARY KEY ( minuta_id );

CREATE TABLE h_modulo (
    modulo_id    NUMBER NOT NULL,
    descripcion  VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN h_modulo.modulo_id IS
    'Identificador del módulo del sistema.';

COMMENT ON COLUMN h_modulo.descripcion IS
    'Descripción del módulo del sistema.';

ALTER TABLE h_modulo ADD CONSTRAINT modulo_pk PRIMARY KEY ( modulo_id );

CREATE TABLE h_oc_huesped (
    oc_huesped_id    NUMBER NOT NULL,
    orden_compra_id  NUMBER NOT NULL,
    persona_id       NUMBER NOT NULL,
    recepcion_flag   NUMBER(1)
);

COMMENT ON COLUMN h_oc_huesped.oc_huesped_id IS
    'Identicador único del huesped de la orden de compra.';

COMMENT ON COLUMN h_oc_huesped.recepcion_flag IS
    'Flag para esteblecer arribo del huesped..';

ALTER TABLE h_oc_huesped ADD CONSTRAINT oc_huesped_pk PRIMARY KEY ( oc_huesped_id,
                                                                    orden_compra_id );

CREATE TABLE h_oc_items (
    oc_item_id                  NUMBER NOT NULL,
    cantidad                    NUMBER NOT NULL,
    orden_pedido_id             NUMBER NOT NULL,
    proveedor_documento_numero  VARCHAR2(100),
    proveedor_entrega_fecha     DATE,
    usuario_id                  NUMBER NOT NULL,
    producto_id                 NUMBER NOT NULL
);

COMMENT ON COLUMN h_oc_items.oc_item_id IS
    'Identificador único del ítem perteneciente a una orden de pedido de productos.';

COMMENT ON COLUMN h_oc_items.cantidad IS
    'Cantidad solicitada.';

COMMENT ON COLUMN h_oc_items.proveedor_documento_numero IS
    'Documento emitido por el proveedor para enviar el ítem.';

COMMENT ON COLUMN h_oc_items.proveedor_entrega_fecha IS
    'Fecha estimada por el proveedor de arribo del producto al hostal.';

ALTER TABLE h_oc_items ADD CONSTRAINT oc_items_pk PRIMARY KEY ( oc_item_id );

CREATE TABLE h_orden_compra (
    orden_compra_id       NUMBER NOT NULL,
    servicio_inicio       DATE NOT NULL,
    servicio_fin          DATE NOT NULL,
    organismo_id          NUMBER NOT NULL,
    revision_fecha        DATE,
    revision_usuario_id   NUMBER NOT NULL,
    visacion_fecha        DATE,
    visacion_usuario_id   NUMBER NOT NULL,
    factura_numero        VARCHAR2(100),
    factura_emision_flag  NUMBER(1),
    factura_usuario_id    NUMBER NOT NULL,
    usuario_id            NUMBER NOT NULL,
    registro_fecha        DATE NOT NULL,
    nulo_fecha            DATE,
    nulo_usuario_id       NUMBER NOT NULL
);

COMMENT ON COLUMN h_orden_compra.orden_compra_id IS
    'Identificador de la orden de compra';

COMMENT ON COLUMN h_orden_compra.servicio_inicio IS
    'Fecha desde cuando se requier el servicio.';

COMMENT ON COLUMN h_orden_compra.servicio_fin IS
    'Fecha de término del servicio.';

COMMENT ON COLUMN h_orden_compra.revision_fecha IS
    'Fecha de cuando es revisada por un usuario,';

COMMENT ON COLUMN h_orden_compra.visacion_fecha IS
    'Fecha en que la órden de compra fué visada.';

COMMENT ON COLUMN h_orden_compra.factura_numero IS
    'Número asociado a la facturación aplicada.';

COMMENT ON COLUMN h_orden_compra.factura_emision_flag IS
    'Flag para establecer si la Orden de copra ha sido facturada.';

COMMENT ON COLUMN h_orden_compra.registro_fecha IS
    'Fecha de registro de la orden de compra.';

COMMENT ON COLUMN h_orden_compra.nulo_fecha IS
    'Fecha de anulación de la orden de compra.';

COMMENT ON COLUMN h_orden_compra.nulo_usuario_id IS
    'Usuario que realiza la anulación de la orden de compra.';

ALTER TABLE h_orden_compra ADD CONSTRAINT orden_compra_pk PRIMARY KEY ( orden_compra_id );

CREATE TABLE h_orden_pedido (
    orden_pedido_id      NUMBER NOT NULL,
    documento_numero     VARCHAR2(100),
    documento_fecha      DATE,
    observacion          VARCHAR2(4000),
    usuario_id           NUMBER NOT NULL,
    registro_fecha       DATE DEFAULT sysdate NOT NULL,
    revision_fecha       DATE,
    revision_usuario_id  NUMBER,
    nulo_fecha           DATE,
    nulo_usuario_id      NUMBER NOT NULL
);

COMMENT ON COLUMN h_orden_pedido.orden_pedido_id IS
    'Identificador interno de la orden de pedido.';

COMMENT ON COLUMN h_orden_pedido.documento_numero IS
    'Número del documento.';

COMMENT ON COLUMN h_orden_pedido.documento_fecha IS
    'Fecha del documento.';

COMMENT ON COLUMN h_orden_pedido.observacion IS
    'Observación adicional.';

COMMENT ON COLUMN h_orden_pedido.registro_fecha IS
    'Fecha en que se registra la órden de pedido.';

COMMENT ON COLUMN h_orden_pedido.revision_fecha IS
    'Fecha en que se accede a la orden de pedido por parte del proveedor.';

COMMENT ON COLUMN h_orden_pedido.revision_usuario_id IS
    'Usuario que realiza la revisión del documento.';

COMMENT ON COLUMN h_orden_pedido.nulo_fecha IS
    'Fecha en que se anula la orden de pedido.';

COMMENT ON COLUMN h_orden_pedido.nulo_usuario_id IS
    'Usuario que realiza la anulación de la orden de pedido.';

ALTER TABLE h_orden_pedido ADD CONSTRAINT op_pk PRIMARY KEY ( orden_pedido_id );

CREATE TABLE h_organismo (
    organismo_id     NUMBER NOT NULL,
    razon_social     VARCHAR2(1000) NOT NULL,
    rut              VARCHAR2(20),
    nombre_fantasia  VARCHAR2(1000),
    giro             VARCHAR2(1000),
    direccion        VARCHAR2(100),
    telefono         VARCHAR2(100),
    cuenta_datos     VARCHAR2(2000),
    persona_id       NUMBER NOT NULL,
    usuario_id       NUMBER NOT NULL,
    registro_fecha   DATE DEFAULT sysdate NOT NULL,
    proveedor_flag   NUMBER,
    comuna_id        NUMBER NOT NULL,
    vigencia         NUMBER(1) DEFAULT 1 NOT NULL
);

COMMENT ON COLUMN h_organismo.organismo_id IS
    'Identificador único de organismo.';

COMMENT ON COLUMN h_organismo.razon_social IS
    'Razón social de organismo.';

COMMENT ON COLUMN h_organismo.rut IS
    'Rol único tributario organismo.';

COMMENT ON COLUMN h_organismo.nombre_fantasia IS
    'Nombre de fantasía del organismo.';

COMMENT ON COLUMN h_organismo.giro IS
    'Giro del proveedor.';

COMMENT ON COLUMN h_organismo.direccion IS
    'Dirección de organismo.';

COMMENT ON COLUMN h_organismo.telefono IS
    'Teléfonos de contacto.';

COMMENT ON COLUMN h_organismo.cuenta_datos IS
    'Antecedentes de cuenta bancaria para gestiones relacionadas a supervisión de transferencias.';

COMMENT ON COLUMN h_organismo.registro_fecha IS
    'Fecha y hora de creación del registro.';

COMMENT ON COLUMN h_organismo.proveedor_flag IS
    'flag para establecer si el organismo es un proveedor.';

COMMENT ON COLUMN h_organismo.vigencia IS
    'Vigencia del cliente.';

ALTER TABLE h_organismo ADD CONSTRAINT organismo_pk PRIMARY KEY ( organismo_id );

CREATE TABLE h_persona (
    persona_id  NUMBER NOT NULL,
    nombres     VARCHAR2(100) NOT NULL,
    paterno     VARCHAR2(100),
    materno     VARCHAR2(50),
    cargo       VARCHAR2(100)
);

COMMENT ON COLUMN h_persona.persona_id IS
    'Identificador de persona.';

COMMENT ON COLUMN h_persona.nombres IS
    'Nombre de persona.';

COMMENT ON COLUMN h_persona.paterno IS
    'Apellido paterno.';

COMMENT ON COLUMN h_persona.materno IS
    'Apellido materno.';

COMMENT ON COLUMN h_persona.cargo IS
    'descripción de cargo de la persona.';

ALTER TABLE h_persona ADD CONSTRAINT persona_pk PRIMARY KEY ( persona_id );

CREATE TABLE h_persona_direccion (
    persona_direccion_id  NUMBER NOT NULL,
    direccion             VARCHAR2(100),
    telefono              VARCHAR2(100),
    email                 VARCHAR2(100),
    persona_id            NUMBER NOT NULL,
    usuario_id            NUMBER NOT NULL,
    registro_fecha        DATE
);

COMMENT ON COLUMN h_persona_direccion.persona_direccion_id IS
    'Identificador único del registro.';

COMMENT ON COLUMN h_persona_direccion.direccion IS
    'Dirección de la persona.';

COMMENT ON COLUMN h_persona_direccion.telefono IS
    'Teléfono de contacto.';

COMMENT ON COLUMN h_persona_direccion.email IS
    'Email de contacto.';

COMMENT ON COLUMN h_persona_direccion.registro_fecha IS
    'Fecha de registro.';

ALTER TABLE h_persona_direccion ADD CONSTRAINT h_persona_direccion_pk PRIMARY KEY ( persona_direccion_id );

CREATE TABLE h_plato (
    plato_id        NUMBER NOT NULL,
    nombre          VARCHAR2(100) NOT NULL,
    ingredientes    VARCHAR2(1000),
    registro_fecha  DATE DEFAULT sysdate NOT NULL,
    vigencia        NUMBER DEFAULT 1 NOT NULL
);

COMMENT ON COLUMN h_plato.plato_id IS
    'Identificador unico de plato.';

COMMENT ON COLUMN h_plato.nombre IS
    'Nombre del plato.';

COMMENT ON COLUMN h_plato.ingredientes IS
    'Descripcion de los ingredientes que requiere el plato.';

COMMENT ON COLUMN h_plato.registro_fecha IS
    'fecha en que se realiza el registro del plato.';

COMMENT ON COLUMN h_plato.vigencia IS
    'Flag para esteblecer vigencia del plato.';

ALTER TABLE h_plato ADD CONSTRAINT plato_pk PRIMARY KEY ( plato_id );

CREATE TABLE h_producto (
    producto_id          NUMBER NOT NULL,
    codigo               VARCHAR2(100) NOT NULL,
    producto_familia_id  NUMBER NOT NULL,
    nombre               VARCHAR2(100) NOT NULL,
    descripcion          VARCHAR2(1000),
    costo_ultimo         NUMBER,
    valor                NUMBER,
    usuario_id           NUMBER NOT NULL,
    registro_fecha       DATE DEFAULT sysdate NOT NULL
);

COMMENT ON COLUMN h_producto.codigo IS
    'Código con formato para asignar a los productos.';

COMMENT ON COLUMN h_producto.nombre IS
    'Nombre del producto';

COMMENT ON COLUMN h_producto.descripcion IS
    'Descripción del producto.';

COMMENT ON COLUMN h_producto.costo_ultimo IS
    'Ultimo costo del producto.';

COMMENT ON COLUMN h_producto.valor IS
    'Valor del producto.';

COMMENT ON COLUMN h_producto.usuario_id IS
    'Usuario que realiza el registro del producto.';

COMMENT ON COLUMN h_producto.registro_fecha IS
    'Fecha de creación del registro.';

ALTER TABLE h_producto ADD CONSTRAINT producto_pk PRIMARY KEY ( producto_id );

CREATE TABLE h_producto_familia (
    producto_familia_id  NUMBER NOT NULL,
    nombre               VARCHAR2(100)
);

COMMENT ON COLUMN h_producto_familia.producto_familia_id IS
    'Identificador único de la familia de productos.';

COMMENT ON COLUMN h_producto_familia.nombre IS
    'Nombre de la familia de productos.';

ALTER TABLE h_producto_familia ADD CONSTRAINT producto_familia_pk PRIMARY KEY ( producto_familia_id );

CREATE TABLE h_region (
    region_id  NUMBER NOT NULL,
    nombre     VARCHAR2(100),
    orden      NUMBER
);

COMMENT ON COLUMN h_region.region_id IS
    'Identificador único de la región.';

COMMENT ON COLUMN h_region.nombre IS
    'Nombre de la región.';

ALTER TABLE h_region ADD CONSTRAINT region_pk PRIMARY KEY ( region_id );

CREATE TABLE h_usuario (
    usuario_id         NUMBER NOT NULL,
    persona_id         NUMBER NOT NULL,
    username           VARCHAR2(100),
    contrasena         VARCHAR2(1000) NOT NULL,
    registro_fecha     DATE DEFAULT sysdate NOT NULL,
    usuario_perfil_id  NUMBER NOT NULL,
    vigencia           NUMBER(1) DEFAULT 1 NOT NULL
);

COMMENT ON COLUMN h_usuario.usuario_id IS
    'Identificación del usuario, corresponde al nombre de usuario.';

COMMENT ON COLUMN h_usuario.username IS
    'Nombre de usuario.';

COMMENT ON COLUMN h_usuario.contrasena IS
    'Contraseña del usuario codificada.';

COMMENT ON COLUMN h_usuario.registro_fecha IS
    'Fecha de creación del usuario.';

COMMENT ON COLUMN h_usuario.vigencia IS
    'Vigencia del usuario.';

CREATE UNIQUE INDEX usuario__idx ON
    h_usuario (
        persona_id
    ASC );

ALTER TABLE h_usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( usuario_id );

CREATE TABLE h_usuario_perfil (
    usuario_perfil_id  NUMBER NOT NULL,
    nombre             VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN h_usuario_perfil.usuario_perfil_id IS
    'identificador único del perfil.';

COMMENT ON COLUMN h_usuario_perfil.nombre IS
    'Nombre del perfil.';

ALTER TABLE h_usuario_perfil ADD CONSTRAINT usuario_perfil_pk PRIMARY KEY ( usuario_perfil_id );

ALTER TABLE h_asistente
    ADD CONSTRAINT asistente_modulo_fk FOREIGN KEY ( modulo_id )
        REFERENCES h_modulo ( modulo_id );

ALTER TABLE h_comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY ( region_id )
        REFERENCES h_region ( region_id );

ALTER TABLE h_orden_compra
    ADD CONSTRAINT h_orden_compra_h_usuario_fk FOREIGN KEY ( nulo_usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_orden_pedido
    ADD CONSTRAINT h_orden_pedido_h_usuario_fk FOREIGN KEY ( nulo_usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_habitacion
    ADD CONSTRAINT habitacion_estado_fk FOREIGN KEY ( habitacion_estado_id )
        REFERENCES h_habitacion_estado ( habitacion_estado_id );

ALTER TABLE h_habitacion
    ADD CONSTRAINT habitacion_tipo_fk FOREIGN KEY ( habitacion_tipo_id )
        REFERENCES h_habitacion_tipo ( habitacion_tipo_id );

ALTER TABLE h_huesped_habitacion
    ADD CONSTRAINT huesped_habitacion_fk FOREIGN KEY ( habitacion_id )
        REFERENCES h_habitacion ( habitacion_id );

ALTER TABLE h_menu
    ADD CONSTRAINT menu_plato_fk FOREIGN KEY ( plato_id )
        REFERENCES h_plato ( plato_id );

ALTER TABLE h_minuta
    ADD CONSTRAINT minuta_menu_fk FOREIGN KEY ( menu_id )
        REFERENCES h_menu ( menu_id );

ALTER TABLE h_oc_huesped
    ADD CONSTRAINT oc_fk FOREIGN KEY ( orden_compra_id )
        REFERENCES h_orden_compra ( orden_compra_id );

ALTER TABLE h_huesped_habitacion
    ADD CONSTRAINT oc_huesped_fk FOREIGN KEY ( huesped_habitacion_id,
                                               huesped_id )
        REFERENCES h_oc_huesped ( oc_huesped_id,
                                  orden_compra_id );

ALTER TABLE h_oc_huesped
    ADD CONSTRAINT oc_huesped_persona_fk FOREIGN KEY ( persona_id )
        REFERENCES h_persona ( persona_id );

ALTER TABLE h_oc_items
    ADD CONSTRAINT oc_items_op_fk FOREIGN KEY ( orden_pedido_id )
        REFERENCES h_orden_pedido ( orden_pedido_id );

ALTER TABLE h_oc_items
    ADD CONSTRAINT oc_items_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES h_producto ( producto_id );

ALTER TABLE h_oc_items
    ADD CONSTRAINT oc_items_usuario_fk FOREIGN KEY ( usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_orden_compra
    ADD CONSTRAINT oc_organismo_fk FOREIGN KEY ( organismo_id )
        REFERENCES h_organismo ( organismo_id );

ALTER TABLE h_orden_compra
    ADD CONSTRAINT oc_usuario_fk FOREIGN KEY ( factura_usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_orden_compra
    ADD CONSTRAINT oc_usuario_fkv2 FOREIGN KEY ( usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_orden_compra
    ADD CONSTRAINT oc_usuario_fkv3 FOREIGN KEY ( revision_usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_orden_compra
    ADD CONSTRAINT oc_usuario_fkv4 FOREIGN KEY ( visacion_usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_orden_pedido
    ADD CONSTRAINT op_usuario_fk FOREIGN KEY ( usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_organismo
    ADD CONSTRAINT organismo_comuna_fk FOREIGN KEY ( comuna_id )
        REFERENCES h_comuna ( comuna_id );

ALTER TABLE h_organismo
    ADD CONSTRAINT organismo_persona_fk FOREIGN KEY ( persona_id )
        REFERENCES h_persona ( persona_id );

ALTER TABLE h_organismo
    ADD CONSTRAINT organismo_usuario_fk FOREIGN KEY ( usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_persona_direccion
    ADD CONSTRAINT persona_direccion_fk FOREIGN KEY ( persona_id )
        REFERENCES h_persona ( persona_id );

ALTER TABLE h_persona_direccion
    ADD CONSTRAINT persona_direccion_usuario_fk FOREIGN KEY ( usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_producto
    ADD CONSTRAINT producto_familia_fk FOREIGN KEY ( producto_familia_id )
        REFERENCES h_producto_familia ( producto_familia_id );

ALTER TABLE h_producto
    ADD CONSTRAINT producto_usuario_fk FOREIGN KEY ( usuario_id )
        REFERENCES h_usuario ( usuario_id );

ALTER TABLE h_usuario
    ADD CONSTRAINT usuario_perfil_fk FOREIGN KEY ( usuario_perfil_id )
        REFERENCES h_usuario_perfil ( usuario_perfil_id );

ALTER TABLE h_usuario
    ADD CONSTRAINT usuario_persona_fk FOREIGN KEY ( persona_id )
        REFERENCES h_persona ( persona_id );

CREATE SEQUENCE h_asistente_asistente_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_asistente_asistente_id_trg BEFORE
    INSERT ON h_asistente
    FOR EACH ROW
    WHEN ( new.asistente_id IS NULL )
BEGIN
    :new.asistente_id := h_asistente_asistente_id_seq.nextval;
END;
/

CREATE SEQUENCE h_comuna_comuna_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_comuna_comuna_id_trg BEFORE
    INSERT ON h_comuna
    FOR EACH ROW
    WHEN ( new.comuna_id IS NULL )
BEGIN
    :new.comuna_id := h_comuna_comuna_id_seq.nextval;
END;
/

CREATE SEQUENCE h_habitacion_habitacion_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_habitacion_habitacion_id_trg BEFORE
    INSERT ON h_habitacion
    FOR EACH ROW
    WHEN ( new.habitacion_id IS NULL )
BEGIN
    :new.habitacion_id := h_habitacion_habitacion_id_seq.nextval;
END;
/

CREATE SEQUENCE h_habitacion_estado_habitacion START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_habitacion_estado_habitacion BEFORE
    INSERT ON h_habitacion_estado
    FOR EACH ROW
    WHEN ( new.habitacion_estado_id IS NULL )
BEGIN
    :new.habitacion_estado_id := h_habitacion_estado_habitacion.nextval;
END;
/

CREATE SEQUENCE h_habitacion_tipo_habitacion_t START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_habitacion_tipo_habitacion_t BEFORE
    INSERT ON h_habitacion_tipo
    FOR EACH ROW
    WHEN ( new.habitacion_tipo_id IS NULL )
BEGIN
    :new.habitacion_tipo_id := h_habitacion_tipo_habitacion_t.nextval;
END;
/

CREATE SEQUENCE h_huesped_habitacion_huesped_h START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_huesped_habitacion_huesped_h BEFORE
    INSERT ON h_huesped_habitacion
    FOR EACH ROW
    WHEN ( new.huesped_habitacion_id IS NULL )
BEGIN
    :new.huesped_habitacion_id := h_huesped_habitacion_huesped_h.nextval;
END;
/

CREATE SEQUENCE h_menu_menu_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_menu_menu_id_trg BEFORE
    INSERT ON h_menu
    FOR EACH ROW
    WHEN ( new.menu_id IS NULL )
BEGIN
    :new.menu_id := h_menu_menu_id_seq.nextval;
END;
/

CREATE SEQUENCE h_minuta_minuta_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_minuta_minuta_id_trg BEFORE
    INSERT ON h_minuta
    FOR EACH ROW
    WHEN ( new.minuta_id IS NULL )
BEGIN
    :new.minuta_id := h_minuta_minuta_id_seq.nextval;
END;
/

CREATE SEQUENCE h_modulo_modulo_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_modulo_modulo_id_trg BEFORE
    INSERT ON h_modulo
    FOR EACH ROW
    WHEN ( new.modulo_id IS NULL )
BEGIN
    :new.modulo_id := h_modulo_modulo_id_seq.nextval;
END;
/

CREATE SEQUENCE h_oc_huesped_oc_huesped_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_oc_huesped_oc_huesped_id_trg BEFORE
    INSERT ON h_oc_huesped
    FOR EACH ROW
    WHEN ( new.oc_huesped_id IS NULL )
BEGIN
    :new.oc_huesped_id := h_oc_huesped_oc_huesped_id_seq.nextval;
END;
/

CREATE SEQUENCE h_oc_items_oc_item_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_oc_items_oc_item_id_trg BEFORE
    INSERT ON h_oc_items
    FOR EACH ROW
    WHEN ( new.oc_item_id IS NULL )
BEGIN
    :new.oc_item_id := h_oc_items_oc_item_id_seq.nextval;
END;
/

CREATE SEQUENCE h_orden_compra_orden_compra_id START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_orden_compra_orden_compra_id BEFORE
    INSERT ON h_orden_compra
    FOR EACH ROW
    WHEN ( new.orden_compra_id IS NULL )
BEGIN
    :new.orden_compra_id := h_orden_compra_orden_compra_id.nextval;
END;
/

CREATE SEQUENCE h_orden_pedido_orden_pedido_id START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_orden_pedido_orden_pedido_id BEFORE
    INSERT ON h_orden_pedido
    FOR EACH ROW
    WHEN ( new.orden_pedido_id IS NULL )
BEGIN
    :new.orden_pedido_id := h_orden_pedido_orden_pedido_id.nextval;
END;
/

CREATE SEQUENCE h_organismo_organismo_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_organismo_organismo_id_trg BEFORE
    INSERT ON h_organismo
    FOR EACH ROW
    WHEN ( new.organismo_id IS NULL )
BEGIN
    :new.organismo_id := h_organismo_organismo_id_seq.nextval;
END;
/

CREATE SEQUENCE h_persona_persona_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_persona_persona_id_trg BEFORE
    INSERT ON h_persona
    FOR EACH ROW
    WHEN ( new.persona_id IS NULL )
BEGIN
    :new.persona_id := h_persona_persona_id_seq.nextval;
END;
/

CREATE SEQUENCE h_persona_direccion_persona_di START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_persona_direccion_persona_di BEFORE
    INSERT ON h_persona_direccion
    FOR EACH ROW
    WHEN ( new.persona_direccion_id IS NULL )
BEGIN
    :new.persona_direccion_id := h_persona_direccion_persona_di.nextval;
END;
/

CREATE SEQUENCE h_plato_plato_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_plato_plato_id_trg BEFORE
    INSERT ON h_plato
    FOR EACH ROW
    WHEN ( new.plato_id IS NULL )
BEGIN
    :new.plato_id := h_plato_plato_id_seq.nextval;
END;
/

CREATE SEQUENCE h_producto_producto_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_producto_producto_id_trg BEFORE
    INSERT ON h_producto
    FOR EACH ROW
    WHEN ( new.producto_id IS NULL )
BEGIN
    :new.producto_id := h_producto_producto_id_seq.nextval;
END;
/

CREATE SEQUENCE h_producto_familia_producto_fa START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_producto_familia_producto_fa BEFORE
    INSERT ON h_producto_familia
    FOR EACH ROW
    WHEN ( new.producto_familia_id IS NULL )
BEGIN
    :new.producto_familia_id := h_producto_familia_producto_fa.nextval;
END;
/

CREATE SEQUENCE h_region_region_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_region_region_id_trg BEFORE
    INSERT ON h_region
    FOR EACH ROW
    WHEN ( new.region_id IS NULL )
BEGIN
    :new.region_id := h_region_region_id_seq.nextval;
END;
/

CREATE SEQUENCE h_usuario_usuario_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_usuario_usuario_id_trg BEFORE
    INSERT ON h_usuario
    FOR EACH ROW
    WHEN ( new.usuario_id IS NULL )
BEGIN
    :new.usuario_id := h_usuario_usuario_id_seq.nextval;
END;
/

CREATE SEQUENCE h_usuario_perfil_usuario_perfi START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER h_usuario_perfil_usuario_perfi BEFORE
    INSERT ON h_usuario_perfil
    FOR EACH ROW
    WHEN ( new.usuario_perfil_id IS NULL )
BEGIN
    :new.usuario_perfil_id := h_usuario_perfil_usuario_perfi.nextval;
END;
/
