namespace PP02.Forms
{
    partial class SignInForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.labelTitle = new System.Windows.Forms.Label();
            this.panelHide = new System.Windows.Forms.Panel();
            this.labelWarning = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.buttonSignIn = new System.Windows.Forms.Button();
            this.buttonBack = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panelHide.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(63, 229);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(244, 70);
            this.button2.TabIndex = 2;
            this.button2.Text = "Режим администратора";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(63, 153);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(244, 70);
            this.button1.TabIndex = 1;
            this.button1.Text = "Обычный режим";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // labelTitle
            // 
            this.labelTitle.AutoSize = true;
            this.labelTitle.Location = new System.Drawing.Point(58, 74);
            this.labelTitle.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.labelTitle.Name = "labelTitle";
            this.labelTitle.Size = new System.Drawing.Size(249, 28);
            this.labelTitle.TabIndex = 0;
            this.labelTitle.Text = "Выберите вариант входа";
            // 
            // panelHide
            // 
            this.panelHide.Controls.Add(this.panel1);
            this.panelHide.Controls.Add(this.labelWarning);
            this.panelHide.Controls.Add(this.textBox1);
            this.panelHide.Controls.Add(this.buttonBack);
            this.panelHide.Controls.Add(this.label1);
            this.panelHide.Location = new System.Drawing.Point(63, 74);
            this.panelHide.Name = "panelHide";
            this.panelHide.Size = new System.Drawing.Size(244, 225);
            this.panelHide.TabIndex = 3;
            // 
            // labelWarning
            // 
            this.labelWarning.AutoSize = true;
            this.labelWarning.ForeColor = System.Drawing.Color.Red;
            this.labelWarning.Location = new System.Drawing.Point(26, 107);
            this.labelWarning.Name = "labelWarning";
            this.labelWarning.Size = new System.Drawing.Size(190, 28);
            this.labelWarning.TabIndex = 6;
            this.labelWarning.Text = "Неверный пароль!";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(0, 69);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(244, 35);
            this.textBox1.TabIndex = 5;
            this.textBox1.UseSystemPasswordChar = true;
            // 
            // buttonSignIn
            // 
            this.buttonSignIn.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.buttonSignIn.Location = new System.Drawing.Point(0, 2);
            this.buttonSignIn.Name = "buttonSignIn";
            this.buttonSignIn.Size = new System.Drawing.Size(244, 40);
            this.buttonSignIn.TabIndex = 4;
            this.buttonSignIn.Text = "Вход";
            this.buttonSignIn.UseVisualStyleBackColor = true;
            this.buttonSignIn.Click += new System.EventHandler(this.buttonSignIn_Click);
            // 
            // buttonBack
            // 
            this.buttonBack.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.buttonBack.Location = new System.Drawing.Point(0, 185);
            this.buttonBack.Name = "buttonBack";
            this.buttonBack.Size = new System.Drawing.Size(244, 40);
            this.buttonBack.TabIndex = 3;
            this.buttonBack.Text = "Назад";
            this.buttonBack.UseVisualStyleBackColor = true;
            this.buttonBack.Click += new System.EventHandler(this.buttonBack_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(35, 0);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(166, 28);
            this.label1.TabIndex = 1;
            this.label1.Text = "Введите пароль";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.buttonSignIn);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 138);
            this.panel1.Name = "panel1";
            this.panel1.Padding = new System.Windows.Forms.Padding(0, 0, 0, 5);
            this.panel1.Size = new System.Drawing.Size(244, 47);
            this.panel1.TabIndex = 7;
            // 
            // SignInForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 28F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(382, 353);
            this.Controls.Add(this.panelHide);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.labelTitle);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(6, 9, 6, 9);
            this.MaximizeBox = false;
            this.Name = "SignInForm";
            this.Text = "Вход в систему";
            this.panelHide.ResumeLayout(false);
            this.panelHide.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelTitle;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Panel panelHide;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button buttonSignIn;
        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label labelWarning;
        private System.Windows.Forms.Panel panel1;
    }
}