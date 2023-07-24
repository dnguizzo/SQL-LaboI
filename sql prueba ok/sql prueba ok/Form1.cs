using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;


namespace sql_prueba_ok
{
    public partial class FormOriginal : Form
    {
        private int conteo = 0;
        public FormOriginal()
        {
            InitializeComponent();
          
            Bitmap img = new Bitmap(Application.StartupPath+@"\img\prueba2.png");
            this.BackgroundImage = img;
            gbxConsulta.Enabled = false;
        } 

        
        private void button1_Click(object sender, EventArgs e)
        { 

            lblConsigna.Text= "1. Para poder hacer un balance comercial, se necesita saber la cantidad de \n  piezas vendidas a personas jurídicas en los últimos 3 años.";
           

            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = @"Data Source=LAPTOP-IUOA091V\SQLEXPRESS;Initial Catalog=metalurgica;Integrated Security=True";
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT count(*) 'Cantidad Ventas'  FROM ordenes_pedidos_clientes opc  JOIN detalle_ordenes_pedidos_clientes dopc ON opc.cod_orden = dopc.cod_orden JOIN clientes c ON c.id_cliente = opc.id_cliente WHERE c.id_tipo_de_cliente = 1 AND datediff (year, opc.fecha_pedido, getdate()) <= 3", cnn);
            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            dgvConsulta.DataSource = table;


        }

        private void btnConsul2_Click(object sender, EventArgs e)
        {
            lblConsigna.Text = " 2.  Necesitamos listar en qué provincia se vendió piezas con cobre y la información básica \n de los clientes (Nombre, apellido y contacto) para largar un descuento a dichos clientes\n  y fomentar el consumo -";

            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = @"Data Source=LAPTOP-IUOA091V\SQLEXPRESS;Initial Catalog=metalurgica;Integrated Security=True";
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct prov.nombre 'Provincia', c.nombre 'Nombre', c.apellido 'Apellido', c.desc_contacto 'Medios de contacto'  FROM provincias prov JOIN localidades loc ON prov.id_provincia = loc.id_provincia JOIN barrios bar ON loc.id_localidad = bar.id_localidad JOIN clientes  c ON bar.id_barrio = c.id_barrio JOIN ordenes_pedidos_clientes opc ON c.id_cliente= opc.id_cliente JOIN detalle_ordenes_pedidos_clientes dopc ON opc.cod_orden= dopc.cod_orden JOIN piezas p ON dopc.id_pieza= p.id_pieza JOIN detalles_ordenes_produccion dprod ON p.id_pieza= dprod.id_pieza JOIN materias_primas mp ON dprod.id_materia_prima= mp.id_materia_prima JOIN costo_materias_primas cmp ON mp.id_costo_mp= cmp.id_costo_mp WHERE (cmp.descripcion = 'cobre') AND (year(opc.fecha_pedido)> year(GETDATE())-5) ORDER BY 'Provincia', nombre ,apellido, desc_contacto", cnn);
            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            dgvConsulta.DataSource = table;

        }

        private void btnconsul3_Click(object sender, EventArgs e)
        {
            lblConsigna.Text = "3 .Se quiere determinar el importe de mano de obra afectada a la producción total de los últimos 5 años por área,\n a los efectos de determinar un bono por productividad equivalente a un 25% de dicho importe por tipo de \n mano de obra y siembre que el importe sea superior a $100. Expresar los resultados redondeados los decimales ";
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = @"Data Source=LAPTOP-IUOA091V\SQLEXPRESS;Initial Catalog=metalurgica;Integrated Security=True";
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT distinct  CMO.descripcion, ROUND((CMO.precio_unitario * MO.cantidad_hs),2) 'IMPORTE TOTAL DE MO', ROUND((CMO.precio_unitario * MO.cantidad_hs),2) * 25/100 'IMPORTE PREMIO ANUAL' FROM detalles_ordenes_produccion DO INNER JOIN mano_de_obras MO ON DO.id_mano_de_obra = MO.id_mano_de_obra  INNER JOIN ordenes_produccion_piezas OP ON DO.id_orden_prod_pieza =  OP.id_orden_prod_pieza INNER JOIN costo_mano_de_obra CMO ON  MO.id_costo_mo =  CMO.id_costo_mo  WHERE YEAR (OP.fecha_inicio)> YEAR(GETDATE())-5 AND YEAR(OP.fecha_fin) > YEAR(GETDATE())-5 AND ROUND((CMO.precio_unitario * MO.cantidad_hs),2 )>= 100", cnn);
            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            dgvConsulta.DataSource = table;
           
        }

        private void btnconsul4_Click(object sender, EventArgs e)
        {
            lblConsigna.Text = "4. Se ha detectado una materia prima, “hierro” de cualquier tipo, con fallas de calidad \n por parte del proveedor, por lo que se quiere identificar las piezas que utilizaron dicha materia \n prima, la cual demoró los procesos de producción por lo que se quiere identificar solo aquellas\n piezas que hayan tenido 2 o más días entre la fecha de inicio y fin. Se quiere conocer los datos y \n dirección de los clientes para poder evaluar las piezas con el cliente y de ser necesario \n reemplazar las mismas";
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = @"Data Source=LAPTOP-IUOA091V\SQLEXPRESS;Initial Catalog=metalurgica;Integrated Security=True";
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT   DO.id_pieza, OP.fecha_inicio , convert(bigint,convert(VARCHAR,DATEDIFF(DAY,OP.fecha_inicio,     OP.fecha_fin))) ' DIAS_PROCESO_PRODUCCIÓN', C.apellido + ', '+C.nombre 'Nombre Completo', C.calle +' '+ convert(varchar,C.num_calle) +' ,'+ b.nombre +' ,' +  l.nombre +' ,'+ pro.nombre 'Direccion', CON.descripcion  + ': ' + C.desc_contacto'Contacto'  FROM detalles_ordenes_produccion DO JOIN materias_primas MP ON DO.id_materia_prima = MP.id_materia_prima JOIN ordenes_produccion_piezas OP ON DO.id_orden_prod_pieza =  OP.id_orden_prod_pieza JOIN costo_materias_primas CMP ON  MP.id_costo_mp=  CMP.id_costo_mp JOIN piezas P on DO.id_pieza = P.id_pieza JOIN detalle_ordenes_pedidos_clientes DC on DC.id_pieza = P.id_pieza JOIN ordenes_pedidos_clientes OC on OC.cod_orden = DC.cod_orden JOIN clientes C on C.id_cliente = OC.id_cliente JOIN barrios B ON B.id_barrio = C.id_barrio JOIN localidades L ON L.id_localidad = B.id_localidad JOIN provincias PRO ON PRO.id_provincia = L.id_provincia JOIN contactos CON ON CON.cod_contacto = C.cod_contacto WHERE CMP.descripcion = 'HIERRO'  AND DATEDIFF(DAY,OP.fecha_inicio,  OP.fecha_fin  ) >=2 ORDER BY OP.fecha_fin, DO.id_pieza, [Nombre Completo]", cnn);
            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            dgvConsulta.DataSource = table;
        }

        private void btnconsul5_Click(object sender, EventArgs e)
        {
            lblConsigna.Text = "5. --Se quiere saber aquellos clientes que hayan comprado en el último semestre del año 2020,\n que sean personas física, y  muestre su contacto si es un telefono celular.";
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = @"Data Source=LAPTOP-IUOA091V\SQLEXPRESS;Initial Catalog=metalurgica;Integrated Security=True";
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT C.apellido + ',  '+C.nombre 'Nombre Completo' , OP.fecha_pedido 'Fecha del Pedido', TC.descripcion 'Tipo de persona',  C.desc_contacto 'Contacto' FROM clientes C JOIN ordenes_pedidos_clientes OP ON OP.id_cliente=C.id_cliente JOIN tipo_de_clientes TC ON TC.id_tipo_de_cliente = C.id_tipo_de_cliente JOIN contactos CO ON CO.cod_contacto=C.cod_contacto WHERE YEAR (OP.fecha_pedido) = 2020 AND (MONTH(OP.fecha_pedido) BETWEEN 06 AND 12) AND TC.descripcion = 'Persona Fisica' AND CO.descripcion = 'Telefono celular'", cnn);
            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            dgvConsulta.DataSource = table;

        }

        private void btnConsulta_Load(object sender, EventArgs e)
        {
            btnconsul4.Enabled = true;
            btnconsul5.Enabled = true;
           
        }

        private void btnconsul6_Click(object sender, EventArgs e)
        {
            lblConsigna.Text = "6.	--Se Necesita conocer el detalle de los productos vendidos este año, listando quien fue el cliente, que precio pago,\n cuando se empezó a trabajar en su pedido y cuando se finalizó.";
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = @"Data Source=LAPTOP-IUOA091V\SQLEXPRESS;Initial Catalog=metalurgica;Integrated Security=True";
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT  opc.cod_orden,opc.fecha_pedido, opp.fecha_inicio,opp.fecha_fin, c.apellido +', '+ c.nombre'Cliente', dopc.cantidad_de_piezas, dopc.precio_pieza, dopc.precio_pieza* dopc.cantidad_de_piezas 'Total $',p.descripcion FROM ordenes_pedidos_clientes opc JOIN detalle_ordenes_pedidos_clientes dopc ON opc.cod_orden=dopc.cod_orden JOIN piezas p ON p.id_pieza= dopc.id_pieza JOIN clientes c ON c.id_cliente= opc.id_cliente JOIN ordenes_produccion_piezas opp ON dopc.id_det_orden= opp.id_det_orden WHERE Year(opc.fecha_pedido)= YEAR(GETDATE())", cnn);
            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            dgvConsulta.DataSource = table;

        }

        private void btnconsul7_Click(object sender, EventArgs e)
        {
            lblConsigna.Text = "7. --CLIENTES QUE HAYAN GASTADO MAS DE 500 MIL PESOS EN EL AÑO 2020 EN UNA SOLA COMPRA DE UN SOLO ITEM";
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = @"Data Source=LAPTOP-IUOA091V\SQLEXPRESS;Initial Catalog=metalurgica;Integrated Security=True";
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT C.apellido + ',  '+ C.nombre  'Nombre Completo', OPC.fecha_pedido 'Fecha de pedido', DOPC.cantidad_de_piezas 'Cantdad de piezas', DOPC.precio_pieza 'Precio de cada pieza', DOPC.cantidad_de_piezas * DOPC.precio_pieza 'Precio total' FROM CLIENTES C  JOIN ordenes_pedidos_clientes OPC ON OPC.cod_orden= C.cod_contacto JOIN detalle_ordenes_pedidos_clientes DOPC ON DOPC.cod_orden=OPC.cod_orden WHERE YEAR(OPC.fecha_pedido)='2020' AND (DOPC.cantidad_de_piezas*DOPC.precio_pieza) > 500000.", cnn);
            DataTable table = new DataTable();
            table.Load(cmd.ExecuteReader());
            cnn.Close();
            dgvConsulta.DataSource = table;

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
           
        }

       

        private void btnComenzar_Click(object sender, EventArgs e)
        {
            string usuario = txtNombre.Text;
            lblInfo.Text = "Le ofrecemos 7 consultas de la Base de Datos de la Metalurgica para que seleccione";
            gbxConsulta.Enabled = true;
            tmrSesion.Start();
            conteo++;
            

            MessageBox.Show("bienvenido " + usuario + " comenzo su sesion, esperamos disfrute del programa", "Buenas Tardes", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnFinalizar_Click(object sender, EventArgs e)
        {
            string usuario = txtNombre.Text;
            
            tmrSesion.Stop();
            
            
                int minutosH = conteo / 60;
                int Rsegundo = conteo % 60;
                int Rhora = minutosH / 60;
                int Rminutos = minutosH % 60;
               
                MessageBox.Show("Gracias " + usuario + " por utilizar este programa \n su sesion duro: " +  Rhora+ " horas " + Rminutos+ " minutos "+ Rsegundo + " Segundos" , "Buenas Noches", MessageBoxButtons.OK, MessageBoxIcon.Information);

            gbxConsulta.Enabled = false;
            lblConsigna.Text = "Esto fue todo, gracias por su tiempo";
            lblConsigna.ForeColor = Color.Red;
            
        }

        private void lbltiempoSesion_Click(object sender, EventArgs e)
        {
           
        }


        private void tmrSesion_Tick(object sender, EventArgs e)
        {
            conteo++;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lblHora.Text = DateTime.Now.ToLongTimeString();
            lblFecha.Text = DateTime.Now.ToLongDateString();
        }

        private void lblFecha_Click(object sender, EventArgs e)
        {
           
        }
    }
}
