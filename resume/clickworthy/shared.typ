#import "../../vendor/clickworthy-resume/src/lib.typ": edu, exp, skills

#let profile = (
  author: "Your Name",
  location: "Seoul, South Korea",
  contacts: (
    [#link("mailto:you@example.com")[#"you@example.com"]],
    [#link("https://github.com/yourhandle")[#"github.com/yourhandle"]],
    [#link("https://linkedin.com/in/yourhandle")[#"linkedin.com/in/yourhandle"]],
    [#link("https://your-site.dev")[#"your-site.dev"]],
  ),
  theme-color: rgb("#0f4c81"),
  font: "New Computer Modern",
  font-size: 11pt,
)

#let summary-for(target) = {
  if target == "backend" {
    "Backend software engineer with experience in distributed systems, APIs, data modeling, and cloud infrastructure. Strong focus on reliability, observability, and shipping maintainable services."
  } else if target == "frontend" {
    "Frontend software engineer with experience building product features, design systems, and performant web applications. Strong focus on user experience, code quality, and cross-functional delivery."
  } else {
    "Software engineer with experience across backend services, web applications, and developer tooling. Strong focus on product impact, pragmatic architecture, and shipping reliable systems."
  }
}

#let skills-for(target) = {
  if target == "backend" {
    (
      ("Languages", ([Go], [Python], [TypeScript], [SQL])),
      ("Backend", ([REST APIs], [Distributed Systems], [PostgreSQL], [Kafka])),
      ("Infra", ([AWS], [Docker], [Kubernetes], [Terraform])),
      ("Practices", ([Observability], [Testing], [Performance], [System Design])),
    )
  } else if target == "frontend" {
    (
      ("Languages", ([TypeScript], [JavaScript], [HTML], [CSS])),
      ("Frontend", ([React], [Next.js], [Design Systems], [Accessibility])),
      ("Tooling", ([Storybook], [Jest], [Playwright], [Vite])),
      ("Practices", ([UX Collaboration], [Performance], [Testing], [Product Delivery])),
    )
  } else {
    (
      ("Languages", ([TypeScript], [Python], [Go], [SQL])),
      ("Frameworks", ([React], [Next.js], [Node.js], [FastAPI])),
      ("Infra", ([AWS], [Docker], [PostgreSQL], [CI/CD])),
      ("Practices", ([Testing], [System Design], [Observability], [Collaboration])),
    )
  }
}

#let hidden-for(target, variants) = target != "general" and not variants.contains(target)

#let education-section(target) = [
  = Education

  #edu(
    institution: "Example University",
    date: "2018-2022",
    degrees: (
      ("BSc", "Computer Science"),
    ),
    gpa: "3.8/4.0",
    location: "Seoul, South Korea",
    extra: "Algorithms TA, ACM ICPC team",
    hide: false,
  )
]

#let experience-section(target) = [
  = Experience

  #exp(
    title: "Software Engineer",
    organization: "Acme Platform",
    date: "2023-Present",
    location: "Remote",
    details: [
      - Built and shipped customer-facing features across backend services and internal tools.
      - Improved release reliability by tightening tests, observability, and deployment workflows.
      - Partnered with product and design to turn ambiguous requests into scoped deliverables.
    ],
    hide: false,
  )

  #exp(
    title: "Backend Engineer Intern",
    organization: "Scale Systems",
    date: "2022-2023",
    location: "Seoul, South Korea",
    details: [
      - Implemented API endpoints and async jobs for data ingestion pipelines.
      - Reduced query latency by redesigning indexes and simplifying high-traffic SQL paths.
      - Added dashboards and alerts for job failures and API saturation.
    ],
    hide: hidden-for(target, ("backend")),
  )

  #exp(
    title: "Frontend Engineer Intern",
    organization: "Product Studio",
    date: "2021-2022",
    location: "Seoul, South Korea",
    details: [
      - Built React and TypeScript interfaces for onboarding and reporting flows.
      - Improved Lighthouse performance and removed avoidable layout shifts on key pages.
      - Worked with designers to translate component specs into reusable UI primitives.
    ],
    hide: hidden-for(target, ("frontend")),
  )
]

#let project-section(target) = [
  = Projects

  #exp(
    title: "Developer Productivity Platform",
    organization: "Personal Project",
    date: "2024",
    location: "Open Source",
    details: [
      - Built a full-stack app for task orchestration, search, and workflow automation.
      - Added typed APIs, background job processing, and deployment automation.
      - Used by a small team to reduce repetitive engineering operations work.
    ],
    hide: false,
  )

  #exp(
    title: "Event Pipeline Monitor",
    organization: "Personal Project",
    date: "2024",
    location: "Open Source",
    details: [
      - Built a pipeline health dashboard with queue lag, retry visibility, and incident drill-down.
      - Designed schema and retention rules for high-volume event telemetry.
      - Focused on operability, debugging, and alert quality for backend workflows.
    ],
    hide: hidden-for(target, ("backend")),
  )

  #exp(
    title: "Component Library Starter",
    organization: "Personal Project",
    date: "2024",
    location: "Open Source",
    details: [
      - Built a reusable component library with tokens, accessibility defaults, and docs examples.
      - Added visual regression coverage and interaction tests for common UI states.
      - Focused on consistency, usability, and developer experience for frontend teams.
    ],
    hide: hidden-for(target, ("frontend")),
  )
]

#let skills-section(target) = [
  = Skills

  #skills(skills-for(target))
]
