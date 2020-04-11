# hostal
Sistema gestión Hostal

I. Descripción del Caso “Sistema de Gestión Hostal DOÑA CLARITA” 
DOÑA CLARITA es una empresa familiar dedicada al alojamiento y servicio de comedor para empresas, orientada principalmente a dar un servicio de calidad y seguridad a trabajadores que necesitan hospedaje por periodos de tiempo. Este servicio es exclusivo para empresa, no aceptan clientes particulares, sólo se hacen convenios con empresas. 
Muchas PYMES tienen grupos de trabajadores que recorren todo Chile desarrollando su especialidad, teniendo problema en los hospedajes y alimentación, que generalmente resultan ser servicios muy caros de implementar y no permiten ser competitivos por los gastos involucrados. 
Por lo anterior, la Señora Clarita vio como una gran proyección para su negocio dar un servicio de hostal, trasformando su casa para este nuevo negocio. 

II. ¿QUÉ SE REQUIERE? Un sistema de software cuya interfaz sea WEB, que permita gestionar los contratos con las empresas tanto local en el establecimiento, como, vía web (sólo para clientes registrados). Cumpliendo con los requerimientos que se detallarán a continuación: 

III. REQUERIMIENTOS ESPECÍFICOS 
- REGISTRO DE CLIENTES El registro de clientes debe poseer una ficha que contenga los datos de la empresa, más, un nombre de usuario y contraseña. 
Esta ficha permitirá tener un registro de los clientes permitiendo generar la facturación. 
- REGISTRO DE HABITACION Se debe registrar las habitaciones que contiene el hostal, permitiendo habilitar o deshabilitar según las siguientes situaciones: 
a) Disponible b) No disponible por estar asignada a empresa c) No disponible por estar en mantenimiento. d) Además, de registrar los datos propios de la habitación (Tipo de cama, accesorios, precio, 
etc.) 
- REGISTRO DE COMEDOR Se debe registrar los diferentes platos que entrega como servicio de comedor con sus respectivos precios. Estos platos deben estar orientado a: Servicios ejecutivos, Especiales, Generales, etc., con una minuta semanal. 
Docente Diseñador Antonio Velásquez Revisor metodológico Paulina Sanhueza 
- REGISTRO DE HUESPED Se debe registrar en una ficha los huéspedes identificando la empresa de procedencia, cotejando con el listado entregado previamente por su empleador de acuerdo a la orden de compra. Asignando la habitación. 
- REGISTRO DE PROVEEDOR Se debe tener una ficha de proveedores con los datos del contacto y su respectivo rubro. Esta información permitirá generar orden de pedido y controlar las recepciones. 
- REGISTRO FACTURA El sistema deberá registrar las ventas realizadas, considerando para este registro los datos del cliente y servicio solicitado. El registro deberá permitir generar información importante para la empresa en apoyo a la toma de decisiones. 
- REGISTROS DE ORDEN DE COMPRA El sistema debe registrar las Órdenes de compra de los distintos clientes, permitiendo chequear en la recepción a los huéspedes. (Considerar que cada huésped debe ser asignado a una habitación). El sistema debe considerar la posibilidad de registrar la lista de huésped enviada por planilla electrónica. 
- REGISTROS DE EMPLEADO. El sistema debe registrar los empleados de la empresa que pueden solicitar producto a los distintos proveedores. 
- REGISTROS DE ORDEN DE PEDIDO El sistema debe registrar las Órdenes de pedido de los distintos proveedores, permitiendo chequear en la recepción a los productos. 
- REGISTRO DE RECEPCIÓN PRODUCTO El sistema utilizará los datos previamente registrados, controlando que la recepción está de acuerdo a las órdenes de pedido. Es decir, el usuario que recepciona el producto lo chequee con la orden de pedido y no permita ingresar un producto que no sea solicitado. La codificación de los productos debe considerar lo siguiente: 
a) 999, los primeros tres dígitos corresponden al ID del Proveedor. b) 999, los tres siguientes dígitos corresponden a la familia del producto, como por ejemplo: c) Aceite, Azucar, etc. d) 99999999, los siguientes 8 dígitos corresponden a la fecha de vencimiento, si no tienen 
fecha de vencimiento se debe llenar con ceros. e) 999, los siguientes tres dígitos corresponden a un número secuencial que corresponde 
al tipo de producto. Por ejemplo: Aceite de 1 litro. Además, de su descripción, precio, stock, stock crítico. 
Docente Diseñador Antonio Velásquez Revisor metodológico Paulina Sanhueza 
- INFORMES Y ESTADÍSTICAS El sistema debe poseer una gran cantidad de informes disponibles para su impresión. Los informes permiten aplicar diferentes filtros que ayuden a seleccionar exactamente qué tipo de informaciones se desea analizar. Además, ofrecer datos completos sobre visitas al sitio web de la hostería. 
- SEGURIDAD Y CONTROLES DE ACCESO 
Debe registrar usuarios con diferentes niveles y posibilidades de acceso, pudiendo restringir o bloquear el acceso a informaciones, estadísticas y demás informaciones sensibles. 
MÓDULOS 
El sistema debe brindar potentes prestaciones a través de una interfaz de sencillo uso. Entre sus características: 
▪ Sistema multiusuario, multiempresa y multi monetario 
▪ Manual en línea (help) vinculado temáticamente al módulo que esté operando en ese momento. 
▪ Informes pre visualizables por pantalla, con opción impresión y exportación a otros formatos (texto, Excel, Word) 
▪ Acceso restringido por claves a cuatro niveles, definido por el usuario (administrador, empleado, cliente y proveedor) 
MODULO DE ADMINISTRACION DE FACTURACIÓN 
El módulo de facturación deberá permitir generar la factura, o anular si existe. 
MÓDULO DE ADMINISTRACIÓN DE HOSTEL. 
El módulo debe permitir la gestión tanto de las habitaciones como los servicios de comedor, mostrar además, los servicios que comercializa la empresa. 
MÓDULO DE ADMINISTRACIÓN DE ORDEN DE VENTA. 
El módulo debe permitir generar orden de pedido con un identificador numérico ascendente, registrando los datos del proveedor, producto y solicitante (Empleado de la empresa). El módulo debe permitir ingresar, modificar y eliminar una orden de pedido (ésta última si es que no ha sido enviada al proveedor) 
USUARIOS DEL SISTEMA 
Administrador: el administrador del sistema es el que podrá ejecutar cambios en el mismo, debe ser tratado como súper usuario que tenga acceso a todo el sistema sin restricciones. 
Cliente: El cliente puede ejecutar los módulos de facturación, servicios del sistema según perfilamiento. 
Docente Diseñador Antonio Velásquez Revisor metodológico Paulina Sanhueza 
Empleado: Usuario que puede generar las ordenes de pedido a los proveedores, con acceso a producto y proveedor. 
Proveedor: Usuario que puede consultar la ordenes de pedido asociada a su Rut. 

IV. TAREAS A REALIZAR
El trabajo es de carácter grupal, cada una de las actividades que está diferenciada por fases, tendrá entregas que deben ser revisadas por su profesor guía, quien le indicará la forma en que se establecerá la organización y comunicación del equipo en la Asignatura y el repositorio de trabajo en que se deberán disponibilizar los avances y entregables del Proyecto para ser visualizados por éste. 
Iteración 1 (Documentación Fase 01) 
● Carta Gantt 
● Casos de uso. 
● Diagrama de Actividad 
● Análisis de base de datos 
● Diseño de Base de Datos 
Iteración 2 (Documentación Fase 02) 
● Correcciones Iteración 01 
● Script de Tablas, Secuencias, Triggers 
● Script de Funciones Almacenadas 
● Script de Procedimiento Almacenados 
● Plan de prueba 
Iteración 3 (Documentación Fase 03) 
● Plan de prueba 
● Manual de usuario 
● Análisis de base de datos (Final) 
● Diseño de Base de Datos 
● PPT Presentación Proyecto 
Docente Diseñador Antonio Velásquez Revisor metodológico Paulina Sanhueza 
