<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'conexion.php';

    $id_producto = $_POST['id_producto'];
    $cantidad = $_POST['cantidad'];
    $nombre = $_POST['nombre'];
    $email = $_POST['email'];

    $sql_update_stock = $conn->prepare("UPDATE Productos SET stock_cantidad = stock_cantidad - ? WHERE id_producto = ?");
    $sql_update_stock->bind_param("ii", $cantidad, $id_producto);
    if ($sql_update_stock->execute()) {
        echo "Compra procesada exitosamente.";
    } else {
        echo "Error al procesar la compra: " . $conn->error;
    }

    $conn->close();
} else {
    echo "Método de solicitud no válido.";
}
?>
