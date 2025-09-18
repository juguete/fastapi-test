# FastAPI 서비스 스캐폴드

## 프로젝트 소개
이 저장소는 FastAPI로 API 서버를 구축할 때 바로 활용할 수 있는 기본 구조와 예시 코드를 제공합니다. 라우터, 설정, 데이터베이스 세션, 의존성, 테스트가 분리되어 있어 확장과 유지보수가 용이합니다.

## 가상환경 설정
WSL(Debian/Ubuntu) 기본 Python은 전역 설치가 제한되므로 프로젝트를 사용할 때는 가상환경을 권장합니다.

1. sudo apt-get install python3.12-venv 명령으로 venv 모듈을 설치합니다.
2. 프로젝트 루트에서 python3 -m venv .venv 로 가상환경을 생성합니다.
3. source .venv/bin/activate 를 실행해 가상환경을 활성화합니다. PowerShell에서는 .venv\Scripts\Activate.ps1 명령을 사용합니다.
4. 가상환경이 활성화된 상태에서 아래 설치 및 실행 명령을 사용하세요.

가상환경을 종료하려면 deactivate 를 입력하면 됩니다.

## 실행 준비 (가상환경 활성화 후)
- Python 버전: 3.10 이상 권장
- 의존성 설치: pip install .
- 개발 모드(테스트 도구 포함): pip install -e .[dev]

## 애플리케이션 실행
uvicorn app.main:app --reload

## 테스트
pytest

## Docker 개발 환경
로컬 가상환경 대신 Docker Compose로 개발할 수도 있습니다. 관련 파일은 Dockerfile, docker-compose.yml, .dockerignore 입니다.

1. .env.example 파일을 .env 이름으로 복사하고 필요한 값을 수정합니다.
2. 도커 이미지를 최초 한 번 빌드합니다.

    docker compose build

3. 개발 서버를 실행합니다.

    docker compose up --build

   코드 변경은 컨테이너에 자동 반영됩니다 (--reload 옵션 적용).

4. 서비스를 중지하려면 아래 명령을 사용합니다.

    docker compose down

### 컨테이너에서 테스트 실행
테스트는 다음 명령으로 컨테이너 안에서 수행할 수 있습니다.

    docker compose run --rm api pytest

## 환경 변수
.env.example 파일을 복사해 .env 로 저장하고 값들을 수정하면 app/core/config.py 에서 자동으로 로드됩니다.
