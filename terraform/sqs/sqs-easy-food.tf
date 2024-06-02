resource "aws_sqs_queue" "pagamento_autorizado_dlq" {
  name                       = "PagamentoAutorizado-dlq"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0
}

resource "aws_sqs_queue" "pagamento_autorizado" {
  name                       = "PagamentoAutorizado"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.pagamento_autorizado_dlq.arn
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "pedido_recebido_dlq" {
  name                       = "PedidoRecebido-dlq"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0
}

resource "aws_sqs_queue" "pedido_recebido" {
  name                       = "PedidoRecebido"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.pedido_recebido_dlq.arn
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "preparo_pedido_iniciado_dlq" {
  name                       = "PreparoPedidoIniciado-dlq"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0
}

resource "aws_sqs_queue" "preparo_pedido_iniciado" {
  name                       = "PreparoPedidoIniciado"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.preparo_pedido_iniciado_dlq.arn
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "preparo_pedido_finalizado_dlq" {
  name                       = "PreparoPedidoFinalizado-dlq"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0
}

resource "aws_sqs_queue" "preparo_pedido_finalizado" {
  name                       = "PreparoPedidoFinalizado"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.preparo_pedido_finalizado_dlq.arn
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "entrega_pedido_realizada_dlq" {
  name                       = "EntregaPedidoRealizada-dlq"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0
}

resource "aws_sqs_queue" "entrega_pedido_realizada" {
  name                       = "EntregaPedidoRealizada"
  visibility_timeout_seconds = 30
  delay_seconds              = 0
  receive_wait_time_seconds  = 0

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.entrega_pedido_realizada_dlq.arn
    maxReceiveCount     = 3
  })
}