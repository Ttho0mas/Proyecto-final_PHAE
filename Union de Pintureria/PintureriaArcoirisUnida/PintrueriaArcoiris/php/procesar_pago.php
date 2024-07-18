<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $metodo_pago = $_POST['metodo_pago'];

    if ($metodo_pago === "mercado_pago") {
        // Redireccionar a la página de Mercado Pago
        header("Location: https://www.mercadopago.com");
        exit;
    } elseif ($metodo_pago === "tarjeta_credito" || $metodo_pago === "tarjeta_debito") {
        // Implementar lógica para procesar tarjetas de crédito/débito
        // Aquí deberías agregar el código para interactuar con la API de pago correspondiente
        // Por ejemplo, iniciar una sesión de pago, generar token de pago, etc.
        // En esta versión de ejemplo, mostraremos un mensaje simple
        echo "Procesamiento de pago con tarjeta: $metodo_pago";
    } elseif ($metodo_pago === "efectivo") {
        // Implementar lógica para pago en efectivo
        echo "Instrucciones para pagar en efectivo";
    } else {
        echo "Método de pago no válido";
    }
} else {
    echo "Método de solicitud no válido.";
}
?>
