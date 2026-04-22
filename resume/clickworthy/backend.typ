#import "../../vendor/clickworthy-resume/src/lib.typ": resume
#import "./shared.typ": profile, summary-for, education-section, experience-section, project-section, skills-section

#show: resume.with(
  author: profile.author,
  location: profile.location,
  contacts: profile.contacts,
  summary: summary-for("backend"),
  theme-color: profile.theme-color,
  font: profile.font,
  font-size: profile.font-size,
)

#education-section("backend")
#experience-section("backend")
#project-section("backend")
#skills-section("backend")
