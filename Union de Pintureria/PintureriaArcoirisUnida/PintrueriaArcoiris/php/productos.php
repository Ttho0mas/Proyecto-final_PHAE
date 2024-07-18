<?php
include 'conexion.php';

$sql = "SELECT id_producto, marca, precio, imagen, descripción FROM Productos";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo '<div class="product-item">';
        echo '<a href="php/detalle_producto.php?id=' . $row["id_producto"] . '">';
        echo '<img src="' . $row["imagen"] . '" alt="' . $row["marca"] . '">';
        echo '<h2>' . $row["marca"] . '</h2>';
        echo '<p class="price">$' . $row["precio"] . '</p>';
        echo '<p class="description">' . $row["descripción"] . '</p>';
        echo '</a>';
        echo '</div>';
    }
} else {
    echo "No se encontraron productos.";
}

$conn->close();
?>
