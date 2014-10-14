class BrochureRacksViewController < UITableViewController
  def init
    super.initWithStyle(UITableViewStylePlain)
  end

  def viewDidLoad
    super
    self.title = "Brochure Racks"

    @brochure_racks ||= []

    ApiClient.fetch_brochure_racks do |success, brochure_racks|
      if success
        @brochure_racks = brochure_racks
        p "Received #{@brochure_racks.length} Brochure Racks"
        self.tableView.reloadData
      else
        App.alert("Oops!")
      end
    end
  end


  def tableView(tableView, numberOfRowsInSection:section)
    @brochure_racks.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_id = "cell"
    cell = tableView.dequeueReusableCellWithIdentifier cell_id
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle UITableViewCellStyleDefault, reuseIdentifier:cell_id
    end

    brochure_rack = @brochure_racks[indexPath.row]
    cell.textLabel.text = brochure_rack.name
    cell
  end
end
