---
title: 'The Hipster Stack™ Technology Stack\apps\web\features\libraries\libraries-catalog.tsx'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Hipster Stack™ Technology Stack\apps\web\features\libraries\libraries-catalog.tsx'
kind: source-document
namespace: 'codependentcoding.source.the-hipster-stack-technology-stack.apps.web.features.libraries.libraries-catalog.tsx'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-hipster-stack-technology-stack
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Hipster Stack™ Technology Stack\apps\web\features\libraries\libraries-catalog.tsx'
source_file: 'libraries-catalog.tsx'
source_sha256: 'ddcddd224540810d028f532beccb945e4b290884d6b549accab94daedbe3de94'
generated: true
---

# `libraries-catalog.tsx`

> [!info] Generated source mirror
> Original path: `The Hipster Stack™ Technology Stack\apps\web\features\libraries\libraries-catalog.tsx`
> SHA-256: `ddcddd224540810d028f532beccb945e4b290884d6b549accab94daedbe3de94`

```tsx
import Image from 'next/image';
import Link from 'next/link';
import { LibraryIcon } from '@/components/library-icon';
import { libraries, libraryCategories } from '@/lib/libraries';
import digitalHerenciaDesert from '../../../../public/Digital Herencia Desert BG.png';

export function LibrariesCatalog() {
  return (
    <>
      <main className="libraries-page">
        <header className="libraries-heading">
          <h1>Simples™</h1>
          <p>
            <span>An ontological survey of idiolectal semantics.</span>
            <span>Esoteric by design.</span>
            <span>No Ordinary Objects™</span>
          </p>
          <small className="simples-joke">
            If you insist this is a collection of composite objects, the
            mereological nihilists would like a word.
          </small>
        </header>
        <section className="library-columns" aria-label="Hipster Stack Simples">
          {libraryCategories.map((category) => (
            <div className="library-category" key={category}>
              <h2>{category}</h2>
              <div>
                {libraries
                  .filter((library) => library.category === category)
                  .map((library) => (
                    <Link
                      href={`/libraries/${library.slug}`}
                      key={library.slug}
                    >
                      <LibraryIcon name={library.icon} />
                      <span>
                        <strong>{library.title}</strong>
                        <small>{library.description}</small>
                      </span>
                    </Link>
                  ))}
              </div>
            </div>
          ))}
        </section>
      </main>
      <Image
        className="simples-landscape"
        src={digitalHerenciaDesert}
        alt=""
        aria-hidden="true"
        sizes="100vw"
      />
    </>
  );
}

```