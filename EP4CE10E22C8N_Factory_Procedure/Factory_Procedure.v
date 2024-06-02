//--------------------------------------------------------------
// 程序描述:
//     EP4CE10E22C8N出厂程序
// 作    者: 凌智电子
// 开始日期: 2020-06-05
// 完成日期: 2020-06-05
// 修改日期:
// 版    本: V1.0:
// 调试工具:
// 说    明:
//
//--------------------------------------------------------------
module Factory_Procedure (
    input  clk,
    input  rst_n,
    input  RX,
    output TX,
    input  K1,
    input  K2,
    input  K3,
    input  K4,
    output LED_R,
    output LED_G,
    output LED_B
);

    // 串口通信模块
    UART_DATA UART_DATA_TEXT (
        .din    (),
        .wr_en  (1'b0),
        .clk_50m(clk),
        .tx     (TX),
        .tx_busy(),
        .rx     (RX),
        .rdy    (),
        .rdy_clr(),
        .dout   ()
    );

    // 按键测试及三色灯测试模块
    KEY U_KEY (
        .clk  (clk),
        .rst_n(rst_n),
        .k1_in(K1),
        .k2_in(K2),
        .k3_in(K3),
        .k4_in(K4),
        .LED_R(LED_R),
        .LED_G(LED_G),
        .LED_B(LED_B)
    );

endmodule
