namespace it.unical.mat.debug
{
	using Id = it.unical.mat.embasp.languages.Id;
	using Param = it.unical.mat.embasp.languages.Param;

[Id("unavailable_cells")]
	public class UnavCells
	{
    [Param(0)] 
    private int row;
    [Param(1)]
    private int column;

		public UnavCells(int r, int c)
		{
			this.row = r;
			this.column = c;
		}

		public UnavCells()
		{
		}

		public virtual int Row
		{
			get
			{
				return row;
			}
			set
			{
				this.row = value;
			}
		}


		public virtual int Column
		{
			get
			{
				return column;
			}
			set
			{
				this.column = value;
			}
		}



		public override string ToString()
		{
			return "unav_cell(" + row + "," + column + "). ";
		}

	}

}