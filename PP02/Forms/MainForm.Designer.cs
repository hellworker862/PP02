namespace PP02
{
    partial class MainForm
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.panelMenu = new System.Windows.Forms.Panel();
            this.buttonAddService = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.labelTypeSignIn = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panelFillterAndSort = new System.Windows.Forms.Panel();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxSearch = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.panelFooter = new System.Windows.Forms.Panel();
            this.labelFooter = new System.Windows.Forms.Label();
            this.panelContainer = new System.Windows.Forms.Panel();
            this.panelMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.panelFillterAndSort.SuspendLayout();
            this.panelFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // panelMenu
            // 
            this.panelMenu.Controls.Add(this.buttonAddService);
            this.panelMenu.Controls.Add(this.button1);
            this.panelMenu.Controls.Add(this.labelTypeSignIn);
            this.panelMenu.Controls.Add(this.pictureBox1);
            this.panelMenu.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelMenu.Location = new System.Drawing.Point(0, 0);
            this.panelMenu.Name = "panelMenu";
            this.panelMenu.Padding = new System.Windows.Forms.Padding(5);
            this.panelMenu.Size = new System.Drawing.Size(1162, 60);
            this.panelMenu.TabIndex = 0;
            // 
            // buttonAddService
            // 
            this.buttonAddService.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.buttonAddService.FlatAppearance.BorderSize = 0;
            this.buttonAddService.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonAddService.Location = new System.Drawing.Point(644, 12);
            this.buttonAddService.Name = "buttonAddService";
            this.buttonAddService.Size = new System.Drawing.Size(250, 39);
            this.buttonAddService.TabIndex = 3;
            this.buttonAddService.Text = "Добавить услугу";
            this.buttonAddService.UseVisualStyleBackColor = true;
            this.buttonAddService.Visible = false;
            this.buttonAddService.Click += new System.EventHandler(this.buttonAddService_Click);
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button1.FlatAppearance.BorderSize = 0;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Location = new System.Drawing.Point(900, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(250, 39);
            this.button1.TabIndex = 2;
            this.button1.Text = "Ближайшие записи";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Visible = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // labelTypeSignIn
            // 
            this.labelTypeSignIn.AutoSize = true;
            this.labelTypeSignIn.Location = new System.Drawing.Point(71, 16);
            this.labelTypeSignIn.Name = "labelTypeSignIn";
            this.labelTypeSignIn.Size = new System.Drawing.Size(64, 28);
            this.labelTypeSignIn.TabIndex = 1;
            this.labelTypeSignIn.Text = "label1";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Dock = System.Windows.Forms.DockStyle.Left;
            this.pictureBox1.Image = global::PP02.Properties.Resources.school_logo;
            this.pictureBox1.Location = new System.Drawing.Point(5, 5);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(60, 50);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // panelFillterAndSort
            // 
            this.panelFillterAndSort.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panelFillterAndSort.Controls.Add(this.label3);
            this.panelFillterAndSort.Controls.Add(this.label2);
            this.panelFillterAndSort.Controls.Add(this.textBoxSearch);
            this.panelFillterAndSort.Controls.Add(this.label1);
            this.panelFillterAndSort.Controls.Add(this.comboBox2);
            this.panelFillterAndSort.Controls.Add(this.comboBox1);
            this.panelFillterAndSort.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelFillterAndSort.Location = new System.Drawing.Point(0, 60);
            this.panelFillterAndSort.Name = "panelFillterAndSort";
            this.panelFillterAndSort.Size = new System.Drawing.Size(1162, 70);
            this.panelFillterAndSort.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(406, 20);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(132, 28);
            this.label3.TabIndex = 4;
            this.label3.Text = "Фильтрация:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(11, 20);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(128, 28);
            this.label2.TabIndex = 3;
            this.label2.Text = "Сортировка:";
            // 
            // textBoxSearch
            // 
            this.textBoxSearch.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxSearch.Location = new System.Drawing.Point(899, 17);
            this.textBoxSearch.Name = "textBoxSearch";
            this.textBoxSearch.Size = new System.Drawing.Size(250, 35);
            this.textBoxSearch.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(812, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(81, 28);
            this.label1.TabIndex = 2;
            this.label1.Text = "Поиск:";
            // 
            // comboBox2
            // 
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Location = new System.Drawing.Point(544, 16);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(250, 36);
            this.comboBox2.TabIndex = 1;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(145, 16);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(250, 36);
            this.comboBox1.TabIndex = 0;
            // 
            // panelFooter
            // 
            this.panelFooter.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panelFooter.Controls.Add(this.labelFooter);
            this.panelFooter.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panelFooter.Location = new System.Drawing.Point(0, 673);
            this.panelFooter.Name = "panelFooter";
            this.panelFooter.Padding = new System.Windows.Forms.Padding(0, 2, 20, 0);
            this.panelFooter.Size = new System.Drawing.Size(1162, 30);
            this.panelFooter.TabIndex = 2;
            // 
            // labelFooter
            // 
            this.labelFooter.AutoSize = true;
            this.labelFooter.Dock = System.Windows.Forms.DockStyle.Right;
            this.labelFooter.Font = new System.Drawing.Font("Comic Sans MS", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.labelFooter.Location = new System.Drawing.Point(942, 2);
            this.labelFooter.Name = "labelFooter";
            this.labelFooter.Size = new System.Drawing.Size(198, 24);
            this.labelFooter.TabIndex = 0;
            this.labelFooter.Text = "загружено 0 из 0 услуг";
            // 
            // panelContainer
            // 
            this.panelContainer.AutoScroll = true;
            this.panelContainer.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelContainer.Location = new System.Drawing.Point(0, 130);
            this.panelContainer.Name = "panelContainer";
            this.panelContainer.Size = new System.Drawing.Size(1162, 543);
            this.panelContainer.TabIndex = 3;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 28F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1162, 703);
            this.Controls.Add(this.panelContainer);
            this.Controls.Add(this.panelFooter);
            this.Controls.Add(this.panelFillterAndSort);
            this.Controls.Add(this.panelMenu);
            this.MinimumSize = new System.Drawing.Size(1180, 47);
            this.Name = "MainForm";
            this.Text = "Главное окно";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
            this.panelMenu.ResumeLayout(false);
            this.panelMenu.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.panelFillterAndSort.ResumeLayout(false);
            this.panelFillterAndSort.PerformLayout();
            this.panelFooter.ResumeLayout(false);
            this.panelFooter.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panelMenu;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label labelTypeSignIn;
        private System.Windows.Forms.Panel panelFillterAndSort;
        private System.Windows.Forms.Panel panelFooter;
        private System.Windows.Forms.Label labelFooter;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.TextBox textBoxSearch;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panelContainer;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button buttonAddService;
    }
}

