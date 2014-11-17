var ProductTag = {
    entity:
    {

        DateModified: "",
        ModifiedBy: "",
        DateCreated: "",
        CreatedBy: "",
        Name: "",
        ID: 0
    },
    init: function () {
             this.entity.DateModified = new Date(),
            this.entity.ModifiedBy = "",
            this.entity.DateCreated = new Date(),
            this.entity.CreatedBy = "",
            this.entity.Name = "",
            this.entity.ID = 0
    }
};