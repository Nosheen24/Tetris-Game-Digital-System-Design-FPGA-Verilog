`timescale 1ns / 1ps

module tb_tetris;

    // ============================
    // Clock & Inputs
    // ============================
    reg clk_too_fast;   // 100 MHz
    reg btn_drop;
    reg btn_rotate;
    reg btn_left;
    reg btn_right;
    reg btn_down;
    reg sw_pause;
    reg sw_rst;

    // ============================
    // Outputs (ignore seg/an)
    // ============================
    wire [7:0] rgb;
    wire hsync;
    wire vsync;

    // ============================
    // DUT Instantiation
    // ============================
    tetris dut (
        .clk_too_fast(clk_too_fast),
        .btn_drop(btn_drop),
        .btn_rotate(btn_rotate),
        .btn_left(btn_left),
        .btn_right(btn_right),
        .btn_down(btn_down),
        .sw_pause(sw_pause),
        .sw_rst(sw_rst),
        .rgb(rgb),
        .hsync(hsync),
        .vsync(vsync),
        .seg(),   // intentionally left unconnected
        .an()     // intentionally left unconnected
    );

    // ============================
    // 100 MHz Clock
    // ============================
    initial begin
        clk_too_fast = 0;
        forever #5 clk_too_fast = ~clk_too_fast;
    end

    // ============================
    // Dumpfile
    // ============================
    initial begin
        $dumpfile("tetris_tb.vcd");
        $dumpvars(0, tb_tetris);
    end

    // ============================
    // Stimulus
    // ============================
    initial begin
        // defaults
        btn_drop   = 0;
        btn_rotate = 0;
        btn_left   = 0;
        btn_right  = 0;
        btn_down   = 0;
        sw_pause   = 0;
        sw_rst     = 0;

        // Reset
        #100;
        sw_rst = 1;
        #200;
        sw_rst = 0;

        // Let game start
        #2_000_000;

        // Move left
        btn_left = 1;
        #50_000;
        btn_left = 0;

        // Move right
        #500_000;
        btn_right = 1;
        #50_000;
        btn_right = 0;

        // Rotate
        #500_000;
        btn_rotate = 1;
        #50_000;
        btn_rotate = 0;

        // Soft drop
        #500_000;
        btn_down = 1;
        #100_000;
        btn_down = 0;

        // Hard drop
        #500_000;
        btn_drop = 1;
        #50_000;
        btn_drop = 0;

        // Pause
        #1_000_000;
        sw_pause = 1;
        #1_000_000;
        sw_pause = 0;

        // Run longer
        #5_000_000;

        $finish;
    end

endmodule
