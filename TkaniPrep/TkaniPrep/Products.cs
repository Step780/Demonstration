//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TkaniPrep
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        public int Product_ID { get; set; }
        public string Name { get; set; }
        public int Cost { get; set; }
        public Nullable<int> ID_Order { get; set; }
    
        public virtual Orders Orders { get; set; }
    }
}
