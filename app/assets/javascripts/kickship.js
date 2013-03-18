$(function(){
  get_donations_chart_info();
  $("#applications_list").on("click", ".vote_button", vote);
});

var user;
var donations;

function cancel_donation_form()
{
  $("#donation_form").empty();
}

function get_donations_chart_info()
{
  if($("#donations_chart").length > 0)
  {
    var uid = $("#uid").text();
    $.ajax({
    dataType: 'json',
    type: "get",
    url: "/users/"+uid+"/chart"
    }).done(process_chart_info);
    return false;
    }
}

function process_chart_info(message)
{
  console.log(message);
  var donations_array = [];
  _.each(message, function(x){ donations_array.push({amount:x.amount, date:x.date})});
  new Morris.Bar({
  // ID of the element in which to draw the chart.
  element: 'donations_chart',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: donations_array,
  // The name of the data record attribute that contains x-values.
  xkey: 'date',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['amount'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['amount'],
  ymin:"auto",
  ymax:"auto"
});
}

function vote()
{
  var aid = $(this).prev().text();
  $.ajax({
  dataType: 'json',
  type: "post",
  url: "/applications/"+aid+"/vote"
  }).done(process_votes);
  return false;
}

function process_votes(message)
{
  $("#applications_list").empty();
  user = message.user;
  donations = message.donations;
  _.each(message.applications, reshow_all_applications);
}

function reshow_all_applications(application)
{
  console.log(application);
  var row = $("<div>").addClass("row app_row");
  // images
  var img_cols = $("<div>").addClass("small-3 columns");
  var img_div = $("<div>").addClass("application_image");
  var img = $("<img>");
  if(application.image == null)
  {
    img.attr("src", "http://insight-dev.glos.ac.uk/departments/lis/lc/PublishingImages/default-profile-image.jpg");
  }
  else
  {
    img.attr("src", application.image);
  }
  img_div.append(img);
  img_cols.append(img_div);
  row.append(img_cols);
  // info
  var info_cols = $("<div>").addClass("small-7 columns");
  var info_div = $("<div>").addClass("application_info");
  info_cols.append(info_div);
  row.append(info_cols);

  var div1 = $("<div>").text(application.tagline);
  var b_tagline = $("<b>").text("Tagline: ");
  div1.prepend(b_tagline);

  var div2 = $("<div>").text(application.age += "");
  var b_age = $("<b>").text("Age: ");
  div2.prepend(b_age);

  var div3 = $("<div>").text(application.bio);
  var b_bio = $("<b>").text("Bio: ");
  div3.prepend(b_bio);
  info_div.append(div1).append(div2).append(div3);

  // votes
  var votes_cols = $("<div>").addClass("small-2 columns");
  var aid = $("<div>").addClass("aid hide");
  aid.text(application.id);
  var vote_btn = $("<div>").addClass("vote_button");
  var link = $("<a>").text("Vote").addClass("button radius");
  link.attr("href", "#");
  if(donations.length > 0 && user.id != application.id && donations.length > user.times_voted)
  {
    vote_btn.append(link);
  }
  votes_cols.append(aid).append(vote_btn);
  row.append(votes_cols);

  $("#applications_list").append(row);

}









