package controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import dao.FacturaDAO;
import model.Factura;
import model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletFacturaPDF")
public class ServletFacturaPDF extends HttpServlet {

    private FacturaDAO facturaDAO = new FacturaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idPedidoParam = request.getParameter("idPedido");
        if (idPedidoParam == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int idPedido;
        try {
            idPedido = Integer.parseInt(idPedidoParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp");
            return;
        }

        List<Factura> detalles = facturaDAO.listarPorPedido(idPedido);

        HttpSession session = request.getSession(false);
        Usuario usuario = null;
        if (session != null) usuario = (Usuario) session.getAttribute("usuarioLogueado");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=factura_" + idPedido + ".pdf");

        try {
            Document document = new Document(PageSize.A4, 36, 36, 54, 36);
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Título
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
            Paragraph title = new Paragraph("Factura - Pedido " + idPedido, titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(Chunk.NEWLINE);

            // Datos cliente (si existen)
            if (usuario != null) {
                Font fLabel = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 11);
                Font fVal   = FontFactory.getFont(FontFactory.HELVETICA, 11);
                PdfPTable info = new PdfPTable(2);
                info.setWidthPercentage(100);
                info.setWidths(new float[]{1f, 2f});
                info.addCell(cell("Cliente:", fLabel, PdfPCell.ALIGN_LEFT, PdfPCell.NO_BORDER));
                info.addCell(cell(usuario.getNombre()!=null?usuario.getNombre():"", fVal, PdfPCell.ALIGN_LEFT, PdfPCell.NO_BORDER));
                info.addCell(cell("ID Cliente:", fLabel, PdfPCell.ALIGN_LEFT, PdfPCell.NO_BORDER));
                // usado getIdUduario() porque confirmaste ese nombre; cámbialo si es necesario
                info.addCell(cell(String.valueOf(usuario.getIdUsuario()), fVal, PdfPCell.ALIGN_LEFT, PdfPCell.NO_BORDER));
                document.add(info);
                document.add(Chunk.NEWLINE);
            }

            // Tabla de detalle
            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);
            table.setWidths(new float[]{4f, 1f, 1f, 1f, 1f});
            table.addCell(headerCell("Producto / ID"));
            table.addCell(headerCell("Talla"));
            table.addCell(headerCell("Cant."));
            table.addCell(headerCell("P. Unit."));
            table.addCell(headerCell("Subtotal"));

            double total = 0.0;
            for (Factura f : detalles) {
                String prod = "ID:" + (f.getIdProducto() != null ? f.getIdProducto() : "") ;
                // Si tienes nombre del producto en sesión o puedes obtenerlo, sustitúyelo aquí.
                table.addCell(cell(prod, FontFactory.getFont(FontFactory.HELVETICA, 10), PdfPCell.ALIGN_LEFT, PdfPCell.NO_BORDER));
                table.addCell(cell(f.getTalla() != null ? f.getTalla() : "-", FontFactory.getFont(FontFactory.HELVETICA, 10), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
                table.addCell(cell(String.valueOf(f.getCantidad()!=null?f.getCantidad():0), FontFactory.getFont(FontFactory.HELVETICA, 10), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
                table.addCell(cell(String.format("%.2f", f.getPrecioUnitario()!=null?f.getPrecioUnitario():0.0), FontFactory.getFont(FontFactory.HELVETICA, 10), PdfPCell.ALIGN_RIGHT, PdfPCell.NO_BORDER));
                table.addCell(cell(String.format("%.2f", f.getSubTotal()!=null?f.getSubTotal(): (f.getCantidad()!=null && f.getPrecioUnitario()!=null ? f.getCantidad()*f.getPrecioUnitario() : 0.0)), FontFactory.getFont(FontFactory.HELVETICA, 10), PdfPCell.ALIGN_RIGHT, PdfPCell.NO_BORDER));
                total += (f.getSubTotal()!=null?f.getSubTotal(): (f.getCantidad()!=null && f.getPrecioUnitario()!=null ? f.getCantidad()*f.getPrecioUnitario() : 0.0));
            }

            document.add(table);
            document.add(Chunk.NEWLINE);

            Paragraph totalP = new Paragraph("Total: Q " + String.format("%.2f", total), FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12));
            totalP.setAlignment(Element.ALIGN_RIGHT);
            document.add(totalP);

            document.close();
        } catch (DocumentException de) {
            throw new IOException(de.getMessage(), de);
        }
    }

    // helpers
    private PdfPCell headerCell(String text) {
        PdfPCell c = new PdfPCell(new Phrase(text, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 11)));
        c.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
        c.setPadding(6);
        return c;
    }

    private PdfPCell cell(String text, Font font, int align, int border) {
        PdfPCell c = new PdfPCell(new Phrase(text, font));
        c.setHorizontalAlignment(align);
        c.setBorder(border);
        c.setPadding(4);
        return c;
    }

    private PdfPCell cell(String text, Font font, int align) {
        return cell(text, font, align, PdfPCell.BOX);
    }
}
